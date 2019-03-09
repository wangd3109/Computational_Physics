program main
      implicit none
      real(8) :: dx,x(10),h,j,b,y,summation1,summation2,h1,h2,tmp,t,m,p,a
      integer ::i,s1,s2,cont
      real,external :: exchange,efield,r
      
      t=1
      j=1.
      b=0
      cont=0

      do i=1,10
      x(i)=1
      end do

      call random_seed()
      do i=1,5
      call random_number(y)
      y=y*10+1
      x(int(y))=-1
      end do                            ! now we have the lattice x(10)

      call hamil(j,b,x,h1)
      print*,"Hamiltonian_initial:",h1,"x",x

      10 continue
      m=0
      call random_number(y)
      y=y*10+1

      x(int(y))=-1*x(int(y))                    !随机翻转某一位置的自旋

      call hamil(j,b,x,h2)

      if (h2 .le. h1) then
              cont=cont+1
              call mag(x,m)
              print*,"-  ","energy decrease:",h1-h2,h1,h2,r(h1,h2,t)
              h1=h2
      else 
              call random_number(tmp)
              if (tmp .lt. r(h1,h2,t)) then
                      cont=cont+1
                      call mag(x,m)
                      print*, "+  ","energy decrease:",h1-h2,h1,h2,r(h1,h2,t),tmp
                      h1=h2
              else
                      print*,h2,tmp
                      x(int(y))=-1*x(int(y))
              end if
      end if

      if (cont .lt. 50) goto 10

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

real function r(h1,h2,t)
        implicit none
        real(8) :: h1,h2,t
        r=exp((h1-h2)/t)
end function

subroutine hamil(j,b,x,h)
        implicit none
        real(8) :: x(10),h,j,b,summation1,summation2
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

subroutine mag(x,m)
        implicit none
        real(8) :: x(10),m
        integer :: i

        do i=1,10
        m=m+x(i)
        end do
end subroutine mag

