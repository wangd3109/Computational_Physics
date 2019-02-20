program main
      implicit none
      real :: p0,p1,p2,pd,x
      integer :: l,i

      l=1

      print *, 'enter x'
      read*,x
      p0=1
      p1=x
      10 continue 
      p2=((2*l+1)*x*p1-l*p0)/(l+1)
      pd=(-l*x*p2+l*p1)/(1-x**2)
      print*,l,x,p0,p1,p2,pd

      p0=p1
      p1=p2
      l=l+1
      if (l .lt. 11 ) goto 10 



end program main
