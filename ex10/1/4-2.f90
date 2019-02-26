program main
        implicit none
        real :: x,p2,pd,h
        integer :: l,i,steps

        l=3
        x=-1
        h=0.01
        steps=2/h
        do i=1,steps+1
        call p(l,x,p2,pd)
        x=x+h
        end do
end program main


subroutine p(l,x,p2,pd)
      implicit none
      real :: p0,p1,p2,pd,x
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

      print*,x,p2,pd

end subroutine p


