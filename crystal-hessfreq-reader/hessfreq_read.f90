!
! Copyright (C) 2013 Alexandr Fonari
! This file is distributed under the terms of the MIT License.
!---------------------------------------------------------------------
! compile as:
!    gfortran -llapack -o hessfreq_read hessfreq_read.f90
!
! run as:
!    hessfreq_read HESSFREQ.DAT
!

program hessfreq_read
    implicit none
    ! parameters
    INTEGER, PARAMETER :: dp=SELECTED_REAL_KIND(10)
    REAL(DP), PARAMETER :: ELECTRONMASS_SI  = 9.10938215E-31_DP   ! Kg
    REAL(DP), PARAMETER :: AMU_SI           = 1.660538782E-27_DP  ! Kg
    REAL(DP), PARAMETER :: AMU_AU           = AMU_SI / ELECTRONMASS_SI
    ! output
    real(DP), allocatable :: mass(:)
    real(DP), allocatable :: fc(:,:)
    real(DP), allocatable :: w2(:), dyn(:)
    ! local
    real(DP), allocatable :: WORK(:)
    integer i, j, l, nat, na, INFO
    CHARACTER(LEN=100) :: hessfreq_fname, line, fmt
    !
    external DSYEV
    external DGEEV
    !
    i = IARGC()
    if (i < 1) THEN
        write(*,'(a)') "usage: hessfreq_read HESSFREQ.DAT"
        STOP
    endif
    CALL GETARG(1, hessfreq_fname)
    !
    open(unit=15,file='masses',status='OLD',form='formatted',ERR=1000, POSITION="REWIND")
    !
    read(15,*,ERR=147) nat
    write(*,'(A,I4,A)') 'Will be reading masses for ', nat, ' atoms'
    allocate(mass(nat))
    allocate(fc(nat*3, nat*3))
    allocate(w2(nat*3))
    allocate( dyn((nat*3)**2) )
    allocate( WORK((nat*3)**2) )
    !
    do i = 1, nat
      read(15,*) mass(i)
      write(*,'(A,I4,A,F7.3,A)') 'mass(',i,') = ', mass(i),' amu'
    enddo
    close(unit=15)
    !
    open(unit=15,file=hessfreq_fname,status='OLD',form='formatted',ERR=1001, POSITION="REWIND")
    !
    ! fancy way of reading HESSFREQ file
    ! the format of which is: FORMAT(1P,4E21.13)
    j = 1
    do
        fmt=''
        read(15,'(A)', end=100) line
        l = len_trim(line)
        write(fmt,'(A,I1,A)') '(1P,',l/21,'E21.13)'
        read(line,fmt) (dyn(i), i=j, j+l/21-1)
        j = j + l/21
        fmt=''
    enddo
100 CONTINUE
    close(15)
    !
    do i = 1, nat*3
        do j = 1, nat*3
            fc(j,i) = dyn(i + (j-1)*nat*3)
!            write(*,*) i, j, fc(j,i)
        enddo
    enddo
    !
    do i = 1, nat*3
        do j = 1, nat*3
            fc(i,j) = fc(i,j)/(AMU_AU*sqrt(mass((i-1)/3+1)*mass((j-1)/3+1)))
      enddo
    enddo
    !
    ! symmetrize
    do i = 1, nat*3
        do j = 1, nat*3
            fc(j,i) = fc(i,j)
      enddo
    enddo
    !
    call DSYEV( 'V', 'U', nat*3, fc, nat*3, w2, WORK, size(WORK), INFO )
    if (INFO /= 0) THEN
        write (*,*) "INFO from DSYEV: ", INFO
        STOP
    endif
    !
    do i = 1,nat*3
       do na = 1,nat
          do j = 1,3
             fc((na-1)*3+j,i) = fc((na-1)*3+j,i)! / sqrt(mass(na))
          end do
       end do
    end do
    !
    write(*,*)'Eigenvectors/SQRT(mass) and eigenvalues of the dynamical matrix to "hessfreq.modes" file...'
    open(unit=15,file='hessfreq.modes',status='UNKNOWN',form='formatted',ERR=1002, POSITION="REWIND")
    call writemodes(nat, w2, fc, 15)
    close(15)
    !
    deallocate(mass)
    deallocate(fc)
    deallocate(w2)
    deallocate(WORK)
    !
    return

1000 CONTINUE
    WRITE(*,"(A)")'ERROR: "masses" file does not exist in the current directory'
    STOP

1001 CONTINUE
    WRITE(*,"(A,A)")'ERROR: the following file does not exist ', hessfreq_fname
    STOP

1002 CONTINUE
    WRITE(*,"(A,A)")'ERROR: access denied for writing ', 'hessfreq.modes'
    STOP

147 CONTINUE
    WRITE(*,*) 'Was expecting number of atoms in the first line of "masses" file.'
    STOP

end program

subroutine writemodes (nat, w2, z, iout)
    implicit none
    ! constants
    INTEGER, PARAMETER :: dp=SELECTED_REAL_KIND(10)
    REAL(DP), PARAMETER :: AU_CMM1          = 0.2194746E+06_DP
    REAL(DP), PARAMETER :: AU_TERAHERTZ     = AU_CMM1*0.2997925E-01
    ! input
    integer nat, iout
    real(DP) w2(3*nat)
    real(DP) z(nat*3, nat*3)
    ! local
    integer nat3, na, ipol, i, j
    real(DP):: freq(3*nat)
    !
    nat3=3*nat
    !
    !  write frequencies and normalized displacements
    !
    do i = 1,nat3
       !
       freq(i)= sqrt(abs(w2(i)))
       if (w2(i).lt.0.0_DP) freq(i) = -freq(i)
       !
       write (iout,9010) i, freq(i)*AU_CMM1
       do na = 1,nat
          write (iout,9020) (z((na-1)*3+ipol,i),ipol=1,3)
       end do
       !
    end do
    write(iout,'(1x,74(''*''))')
    !
    return
    !
9010 format(5x, i3, 3x, f15.6, ' [cm-1]')
9020 format (1x,'(',3 (f10.6,3x),')')
    !
end subroutine writemodes

