program main
      implicit none
      real :: dx,x(10),h,j,b,y,summation1,summation2,h1,h2,tmp
      integer ::i,s1,s2,k,cont
      real,external :: exchange,efield,r


      dx=1
      j=1.
      b=0
      cont=0

      do i=1,10
      x(i)=1
      end do

      call random_seed()

      call hamil(j,b,x,h1)
      print*,h1

      10 continue
      call random_number(y)
      y=y*10+1
      cont=cont+1

      x(int(y))=-1*x(int(y))

      call hamil(j,b,x,h2)
      print*,cont

      if (r(h1,h2) .gt. 1) then
              print*,"accepted","energy difference:",h2-h1,"possibility:",r(h1,h2)
              h1=h2
              goto 10
      else 
              call random_number(tmp)
              if (tmp .lt. r(h1,h2)) then
                      print*,"accepted","energy difference:",h2-h1,tmp,"with the possibility:",r(h1,h2)
                      h1=h2
              else
                      print*,"rejected",h1-h2,r(h1,h2)
                      h1=h1
              end if

              goto 10
      end if

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
        
end subroutine hamil

