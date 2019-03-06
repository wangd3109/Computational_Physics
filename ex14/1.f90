program main
      implicit none
      real :: dx,x(10),h,j,b,y,summation1,summation2
      integer ::i,s1,s2,k
      real,external :: exchange,efield


      dx=1
      j=1.
      b=0

      do i=1,10
      x(i)=1
      end do

      call hamil(j,b,x,h)


      call random_seed()
      call random_number(y)
      y=y*10+1

      x(int(y))=-1

      call hamil(j,b,x,h)
!      print

end program main

real function exchange(a,b)
        implicit none
        integer :: a,b
        exchange=a*b
end function

real function efield(a)
        implicit none
        integer :: a
        efield=a
end function

real function r(h1,h2)
        implicit none
        real :: h1,h2
        r=exp(h1-h2)
end function

subroutine hamil(j,b,x,h)
        implicit none
        real :: x(10),h,j,b,summation1,summation2
        integer :: i,s1,s2
        real,external :: exchange, efield

        summation1=0
        summation2=0
        h=0
        
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


        do i=1,10
        s1=x(i)
        summation2=summation2+efield(s1)
        end do


        h=-j*summation1-b*summation2
        
        print*,"Hamiltonian:",h

end subroutine hamil

