program main
        implicit none
        real(8) :: x,p2,pd,h,x1,x2,px1,px2,gap,tolerance,w
        integer :: l,i,steps,cont
        
        do l=2,10
        print*,l
        x1=-1.
        h=0.01
        gap=2./(2*l)
        x2=x1+gap
        tolerance=1.e-7

        10 continue
        call p(l,x1,p2,pd)
        px1=p2
        call p(l,x2,p2,pd)
        px2=p2
                if (px1*px2 .lt. 0) then
                x2=(x1+x2)/2
!                print*,"-",x1,x2
                else
                x2=2*x2-x1
                x1=(x1+x2)/2
!                print*,"+"
                end if
        if (abs(x1-x2) .gt. tolerance) goto 10


        call p(l+1,x1,p2,pd)
        w=2*(1-x1**2)/((l+1)**2*p2*p2)

        print*,x1,w
        if (x2+gap .lt. 1) then
                x1=x1+gap
                x2=x2+2*gap
                goto 10
        end if
        end do

end program main

subroutine p(l,x,p2,pd)
      implicit none
      real(8) :: p0,p1,p2,pd,x
      integer :: l,i


      p0=1
      p1=x
      do i=1,l-1
      p2=((2*i+1)*x*p1-i*p0)/(i+1)
      pd=(-i*x*p2+i*p1)/(1-x**2)
!      print*,"l=",l,"x=",x,i,p0,p1,p2

      p0=p1
      p1=p2
      end do

!      print*,x,p2

end subroutine p

