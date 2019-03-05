program main
      implicit none
      real :: dx,x(10),h,j,b
      integer ::i,s1,s2,summation1,summation2,k
      real,external :: exchange,efield

      dx=1
      j=1
      b=0

      do i=1,10
      x(i)=1
      print*,x(i)
      end do

      print*,x(1),x(3)

      do i=1,10
      if (i .ne. 10) then
              s1=x(i)
              s2=x(i+1)
      else 
              s1=x(10)
              s2=x(1)
      end if
      summation1=summation1+exchange(s1,s2)
      end do
      print*, summation1

      do i=1,10
      s1=x(i)
      summation2=summation2+efield(s1)
      end do
      print*,summation2

      h=-j*summation1-b*summation2
      print*,"h",h


end program main

real function exchange(a,b)
        integer :: a,b
        exchange=a*b
end function

real function efield(a)
        integer :: a
        efield=a
end function

