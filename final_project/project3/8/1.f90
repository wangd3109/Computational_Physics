program main
      implicit none
      real(8) :: x(10),j,b,randomn,summation1,summation2,h1,h2,tmp,t,m,summationh,summationm,averageh,averagem
      integer ::i,s1,s2,cont,steps
      real,external :: exchange,efield,r
      
      t=1       ! temperature
      j=1.      ! exchange parameter
      b=0       ! electric field
      cont=0
      steps=1000

      do i=1,10
      x(i)=1
      end do

      call random_seed()
      do i=1,10/2
      call random_number(randomn)
      randomn=randomn*10+1
      x(int(randomn))=-1
      end do                            ! now we have the lattice x(10)

      call hamil(j,b,x,h1)
      call mag(x,m)
      summationh=h1
      summationm=m
      cont=1
!      print*,x
      print*,cont,"   ","Hamiltonian:",h1,"Magnetization:",m
      

      10 continue
      m=0
      call random_number(randomn)
      randomn=randomn*10+1

      x(int(randomn))=-1*x(int(randomn))                    !随机翻转某一位置的自旋

      call hamil(j,b,x,h2)

      if (h2 .le. h1) then
              cont=cont+1
              call mag(x,m)
              summationh=summationh+h2
              summationm=summationm+m
!              print*,x
              print*,cont,"-  ","Hamiltonian:",h2,"Magnetization:",m
              h1=h2
      else 
              call random_number(tmp)
              if (tmp .lt. r(h1,h2,t)) then
                      cont=cont+1
                      call mag(x,m)
                      summationh=summationh+h2
                      summationm=summationm+m
!                      print*,x
                      print*,cont, "+  ","Hamiltonian:",h2,"Magnetization:",m
                      h1=h2
              else
!                      print*,h2,tmp
                      x(int(randomn))=-1*x(int(randomn))
              end if
      end if

      if (cont .lt. steps) goto 10
       
      averageh=summationh/steps
      averagem=summationm/steps
      print* ,averageh,averagem

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
        real(8) :: x(10),h,j,b,summation1,summation2         !这里x没有问题？
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

