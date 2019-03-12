program main
      implicit none
      real(8) :: x(10),j,b,randomn,summation1,summation2,h1,h2,tmp,t,m,summationh,summationm,averageh,averagem,mag
      integer ::i,s1,s2,cont,steps,grid,k
      real,external :: exchange,efield,r
 
      do k=1,30     
      t=0.4*k       ! temperature
      j=1.      ! exchange parameter
      b=0       ! electric field
      cont=0
      steps=10000
      grid=10

      do i=1,grid
      x(i)=1
      end do

      call random_seed()
      do i=1,grid/2
      call random_number(randomn)
      randomn=randomn*grid+1
      x(int(randomn))=-1
      end do                            ! now we have the lattice x(10)

      call hamil(grid,j,b,x,mag,h1)
      summationh=h1
      mag=abs(mag)
      summationm=mag
      cont=1
!      print*,x
!      print*,cont,"   ","Hamiltonian:",h1,"Magnetization:",mag
      

      10 continue
      m=0
      call random_number(randomn)
      randomn=randomn*grid+1

      x(int(randomn))=-1*x(int(randomn))                    !随机翻转某一位置的自旋

      call hamil(grid,j,b,x,mag,h2)
      mag=abs(mag)

      if (h2 .le. h1) then
              cont=cont+1
              summationh=summationh+h2
              summationm=summationm+mag
!              print*,x
!              print*,cont,"-  ","Hamiltonian:",h2,"Magnetization:",mag
              h1=h2
      else 
              call random_number(tmp)
              if (tmp .lt. r(h1,h2,t)) then
                      cont=cont+1
                      summationh=summationh+h2
                      summationm=summationm+mag
!                      print*,x
!                      print*,cont, "+  ","Hamiltonian:",h2,"Magnetization:",mag
!                      h1=h2
              else
!                      print*,h2,r(h1,h2,t),tmp
                      x(int(randomn))=-1*x(int(randomn))
              end if
      end if

      if (cont .lt. steps) goto 10
       
      averageh=summationh/steps
      averagem=summationm/steps
      print* ,t,averageh,averagem

      end do

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

subroutine hamil(grid,j,b,x,mag,h)
        implicit none
        real(8) :: x(10),h,j,b,summation1,mag        !这里x没有问题？
        integer :: i,s1,s2,grid
        real,external :: exchange, efield

        summation1=0
        mag=0
        h=0
        
        do i=1,grid
        if (i .ne. grid) then
                s1=x(i)
                s2=x(i+1)
        else
                s1=x(grid)
                s2=x(1)
        end if

        summation1=summation1+exchange(s1,s2)
        end do


        do i=1,grid
        s1=x(i)
        mag=mag+efield(s1)
        end do


        h=-j*summation1-b*mag
        
end subroutine hamil

