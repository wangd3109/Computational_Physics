program main
        implicit none
        real ::b,V0,E,rmax,angle,rmin,a
        integer:: i
        real,external :: exact1,V

        do i=5,30
        b=1*i
        V0=3.
        E=10.
        rmax=30
        a=10.

        call theta(a,b,rmax,V0,E,angle)


        end do

end program main

subroutine theta(a,b,rmax,V0,E,angle)
        implicit none
        real :: r,b,rmax,V0,E,angle,rmin,dr1,dr2,summation1,summation2,angle2,a
        real,external :: f1,term1,term2,exact,V
        integer :: steps,i

        print*,r,rmin,a

!        call getrmin(b,V0,E,rmax,rmin)
!        print*,"rmin:",rmin,"V:",V(V0,a,r),"V0:",V0,"a:",a,"r:",r
        steps=1000
        dr1=(rmax-b)/(4.*steps)
        dr2=(rmax-rmin)/(4.*steps)  !注意rmin

        r=b
        summation1=0
        do i=1,steps
        call getrmin(b,V0,E,rmax,rmin)
        print*,"rmin:",rmin,"V:",V(V0,a,r),"V0:",V0,"a:",a,"r:",r
        r=b+(i-1)*4*dr1
!        summation1=summation1+term1(r,dr1)
!        print*,"integration1:",i,r,"dr:",dr1,r+4*dr1,summation1
        end do

        r=rmin
        summation2=0
        do i=1,steps
        r=rmin+(i-1)*4*dr2
!        summation2=summation2+term2(r,dr2,E,V)
!        print*,"integration #2:",i,r,r+4*dr2,summation2
        end do

!        call inte1(b,r,dr1,steps,summation1)
!        call inte2(b,r,dr2,E,V,rmin,steps,summation2)
!        print*,"summation #1:",summation1,"exact #1:",exact1(b,V,E,rmax)
!        print*,"summation #2:",summation2,"exact #2:",exact3(b,V,E,rmin,rmax)

!        angle=2*b*(summation1-summation2)
!        angle2=exact(b,V,E,rmax)

!        print*,"b:",b,"rmin:",rmin,"angle:",angle,"exact:",angle2,"angle difference:",angle-angle2
       
end subroutine theta

real function f1(r,b)                     !第一项1
        implicit none
        real :: r,b

        f1=1/r**2/sqrt(1-(b/r)**2)
        !f1=exp(r)
end function f1

real function term1(r,dr1)                 !第一项2
        implicit none
        real :: r,dr1,b
        real,external :: f1

        term1=(7*f1(r,b)+32*f1(r+dr1,b)+12*f1(r+2*dr1,b)+32*f1(r+3*dr1,b)+7*f1(r+4*dr1,b))*(2*dr1/45)
end function

real function f2(r,b,E,V)                 !第二项1
        implicit none
        real :: r,b,V,E

        f2=1/r**2/sqrt(1-(b/r)**2-V/E)
end function f2

real function term2(r,dr2,E,V)           !第二项2. 这里需不需要E,V的信息？
        implicit none
        real :: r,dr2,b,E,V
        real,external :: f2

        term2=(7*f2(r,b,E,V)+32*f2(r+dr2,b,E,V)+12*f2(r+2*dr2,b,E,V)+32*f2(r+3*dr2,b,E,V)+7*f2(r+4*dr2,b,E,V))*(2*dr2/45)
end function term2

subroutine inte1(b,r,dr1,steps,summation1)      !第一个积分
        implicit none
        real ::r,dr1,b,summation1
        integer :: i, steps
        real,external :: term1
        
        r=b
        summation1=0
        do i=1,steps-1
        summation1=summation1+term1(r,dr1)
        r=r+4*dr1
!        print*,"inte1",i,summation1,term1(r,dr1),r,dr1,b
        end do
end subroutine inte1

subroutine inte2(b,r,dr2,E,V,rmin,steps,summation2)         !第二个积分
        implicit none
        real ::r,rmin,summation2,dr2,E,V,b
        integer ::steps,i
        real,external ::term2

        r=rmin
        summation2=0
        do i=1,steps-1
        summation2=summation2+term2(r,dr2,E,V)
        r=r+4*dr2
        end do
end subroutine inte2

subroutine getrmin(b,V0,E,rmax,rmin)            !计算rmin
        implicit none
        real :: rmin,rmax,dr,b,V0,E,tolerance,a,r
        real,external :: V

        rmin=rmax
        dr=0.1
        tolerance=1.e-5

        10 if (1-b**2/rmin**2-V(V0,a,r)/E .gt. 0) then
                rmin=rmin-dr
                goto 10
        else if (abs(1-b**2/rmin**2-V(V0,a,r)/E) .gt. tolerance) then
                rmin=rmin+dr
                dr=dr/2.
                rmin=rmin-dr
                goto 10
        else
        end if
        rmin=rmin+dr

end subroutine getrmin

real function exact(b,V0,E,rmax)
        implicit none
        real :: b,V0,E,rmax,a,r
        real,external :: V

        exact=2*(asin(b/(rmax*sqrt(1-V(V0,a,r)/E)))-asin(b/rmax))

end function exact

real function V(V0,a,r)
        implicit none
        real :: V0,a,r

        V=4*V0*((a/r)**12-(1/r)**6)
end function V


