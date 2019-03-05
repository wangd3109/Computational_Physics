program main
      implicit none
      real :: dx,x(10),h,j,b,y
      integer ::i,s1,s2,summation1,summation2,k
      real,external :: exchange,efield


      dx=1
      j=1
      b=0

      do i=1,10
      x(i)=1
      end do


      call random_seed()
      call random_number(y)
      y=y*10+1
      print*,y,int(y)

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
!      print*, summation1

      do i=1,10
      s1=x(i)
      summation2=summation2+efield(s1)
      end do
!      print*,summation2

      h=-j*summation1-b*summation2


end program main

real function exchange(a,b)
        integer :: a,b
        exchange=a*b
end function

real function efield(a)
        integer :: a
        efield=a
end function

