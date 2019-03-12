program main
      implicit none
      real(8) :: lattice(8,8),jex,b,randomx,randomy,summation1,mag,h1,h2,tmp,t,m,summationh,summationm,averageh,averagem
      integer ::i,j,s1,s2,cont,steps,grid
      real,external :: exchange,efield,r
      
      t=2.     ! temperature
      jex=1.      ! exchange parameter
      b=0.       ! electric field
      cont=0
      steps=1000
      grid=8

      do i=1,grid          !lattice
      do j=1,grid
      lattice(i,j)=1
      end do
      end do

      call random_seed()
      do i=1,grid/2                               ! specify how many spins you want to flip
      call random_number(randomx)
      call random_number(randomy)
      randomx=randomx*grid+1              !lattice
      randomy=randomy*grid+1
      lattice(int(randomx),int(randomy))=-1
      end do                            ! now we have the lattice x(10)

      print*,lattice
      call hamil(grid,jex,b,lattice,mag,h1)
      summationh=h1
      summationm=mag
      cont=1
      print*,cont,"   ","Hamiltonian:",h1,"Magnetization:",mag

      10 continue
      mag=0
      call random_number(randomx)
      call random_number(randomy)
      randomx=randomx*grid+1               !lattice
      randomy=randomy*grid+1

      lattice(int(randomx),int(randomy))=-1      !随机翻转某一位置的自旋


      call hamil(grid,jex,b,lattice,mag,h2)

      if (h2 .le. h1) then
              cont=cont+1
              summationh=summationh+h2
              summationm=summationm+mag
              print*,cont,"-  ","Hamiltonian:",h2,"Magnetization:",mag,"energy difference:",h2-h1,r(h1,h2,t)
              h1=h2
      else 
              call random_number(tmp)
              if (tmp .lt. r(h1,h2,t)) then
                      cont=cont+1
                      summationh=summationh+h2
                      summationm=summationm+mag
                      print*,cont, "+  ","Hamiltonian:",h2,"Magnetization:",mag,"energy difference:",h2-h1,"r",r(h1,h2,t),tmp
                      h1=h2
              else
                      print*,"rejection, energy difference:+", h2-h1,"magnetization:",mag, "r",r(h1,h2,t),tmp
                      lattice(int(randomx),int(randomy))=-1*lattice(int(randomx),int(randomy))
              end if
      end if

      if (cont .lt. steps) goto 10
       
      averageh=summationh/steps
      averagem=summationm/steps
      print* ,averageh,averagem

end program main

real function exchange(s0,su,sd,sl,sr)
        implicit none
        integer :: s0,su,sd,sl,sr
        exchange=s0*(su+sd+sl+sr)
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

subroutine hamil(grid,jex,b,lattice,mag,h)
        implicit none
        real(8) :: lattice(8,8),h,jex,b,summation1,mag         !lattice
        integer :: i,j,s0,su,sd,sl,sr,grid
        real,external :: exchange, efield

        summation1=0
        mag=0
        h=0
        
        do i=1,grid                                           !lattice
        do j=1,grid
        s0=lattice(i,j)
        if (i .eq. 1) then
                if (j .eq. 1) then
                        su=lattice(i,j+1)
                        sd=lattice(i,grid)
                        sl=lattice(grid,j)
                        sr=lattice(i+1,j)
                else if (j .gt. 1 .and. j .lt. grid) then
                        su=lattice(i,j+1)
                        sd=lattice(i,j-1)
                        sl=lattice(grid,j)
                        sr=lattice(i+1,j)
                else if (j .eq. grid) then
                        su=lattice(i,1)
                        sd=lattice(i,j-1)
                        sl=lattice(grid,j)
                        sr=lattice(i+1,j)
                end if
        else if (i .gt. 1 .and. i .lt. grid) then
                if (j .eq. 1) then
                        su=lattice(i,j+1)
                        sd=lattice(i,grid)
                        sl=lattice(i-1,j)
                        sr=lattice(i+1,j)
                else if (j .gt. 1 .and. j .lt. grid) then
                        su=lattice(i,j+1)
                        sd=lattice(i,j-1)
                        sl=lattice(i-1,j)
                        sr=lattice(i+1,j)
                else if (j .eq. grid) then
                        su=lattice(i,1)
                        sd=lattice(i,j-1)
                        sl=lattice(i-1,j)
                        sr=lattice(i+1,j)
                end if
        else if (i .eq. grid) then
                if ( j .eq. 1) then
                        su=lattice(i,j+1)
                        sd=lattice(i,grid)
                        sl=lattice(i-1,j)
                        sr=lattice(1,j)
                else if (j .gt. 1 .and. j .lt. grid) then
                        su=lattice(i,j+1)
                        sd=lattice(i,j-1)
                        sl=lattice(i-1,j)
                        sr=lattice(1,j)
                else if (j .eq. grid) then
                        su=lattice(i,1)
                        sd=lattice(i,j-1)
                        sl=lattice(i-1,j)
                        sr=lattice(1,j)

                end if
        end if

        summation1=summation1+exchange(s0,su,sd,sl,sr)
        end do
        end do


        do i=1,grid                                               !lattice
        do j=1,grid
        s0=lattice(i,j)
        mag=mag+efield(s0)
        end do
        end do

        summation1=summation1/2
        h=-jex*summation1-b*mag
        
end subroutine hamil

