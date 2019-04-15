program main
        implicit none
        real ::b,V,E,rmax,angle

        b=1
        V=10
        E=20
        rmax=5
        
        call theta(b,rmax,V,E,angle)

        print*, b,angle
end program main

subroutine theta(b,rmax,V,E,angle)
        implicit none
        real :: r,b,rmax,V,E,angle,rmin,dr1,dr2,summation1,summation2
        integer :: steps

        call getrmin(b,V,E,rmin)
        print*,"rmin:",rmin
        steps=100
        dr1=(rmax-b)/(4.*steps)
        dr2=(rmax-rmin)/(4.*steps)  !注意rmin

        call inte1(b,r,dr1,summation1)
        call inte2(r,dr2,summation2)
        print*,summation1

        angle=2*b*(summation1-summation2)
end subroutine theta

real function f1(r,b)                     !第一项1
        implicit none
        real :: r,b

        f1=(1.-(b**2/r**2))**(-1/2)/r**2
end function f1

real function term1(r,dr1)                 !第一项2
        implicit none
        real :: r,dr1,b
        real,external :: f1

        term1=(7*f1(r,b)+32*f1(r+dr1,b)+12*f1(r+2*dr1,b)+32*f1(r+3*dr1,b)+7*f1(r+4*dr1,b))*(2*dr1/45)
end function

real function f2(r,b)                 !第二项1
        implicit none
        real :: r,b,V,E

        f2=(1.-b**2/r**2-V/E)**(-1/2)/r**2
end function f2

real function term2(r,dr2)           !第二项2. 这里需不需要E,V的信息？
        implicit none
        real :: r,dr2,b
        real,external :: f2

        term2=(7*f2(r,b)+32*f2(r+dr2,b)+12*f2(r+2*dr2,b)+32*f2(r+3*dr2,b)+7*f2(r+4*dr2,b))*(2*dr2/45)
end function term2

subroutine inte1(b,r,dr1,summation1)      !第一个积分
        implicit none
        real ::r,dr1,b,summation1,d
        integer :: i, steps
        real,external :: term1
        
        r=d
        summation1=0
        do i=1,steps
        summation1=summation1+term1(r,dr1)
        r=r+4*dr1
        print*,r
        end do
end subroutine inte1

subroutine inte2(r,dr2,summation2)         !第二个积分
        implicit none
        real ::r,rmin,summation2,dr2
        integer ::steps,i
        real,external ::term2

        r=rmin
        summation2=0
        do i=1,steps
        summation2=summation2+term2(r,dr2)
        r=r+4*dr2
        print*,r
        end do
end subroutine inte2

subroutine getrmin(b,V,E,rmin)            !计算rmin
        implicit none
        real :: rmin,rmax,dr,b,V,E,tolerance

        rmin=rmax
        dr=0.1
        tolerance=1.e-5

        10 if (1-b**2/rmin**2-V/E .gt. 0) then
                rmin=rmin-dr
        else if (abs(1-b**2/rmin**2-V/E) .gt. tolerance) then
                rmin=rmin+dr
                dr=dr/2.
                rmin=rmin-dr
                goto 10
        else
                stop
        end if
end subroutine getrmin

