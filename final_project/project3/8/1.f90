program main
      implicit none
      real(8) :: lattice(8,8),jex,b,randomx,randomy,h1,h2,tmp,t,summationh,summationm,averageh,averagem,mag,start,finish
      integer ::i,j,s1,s2,cont,steps,grid,k
      character (len=100) :: filename
      real,external :: exchange,efield,r
 
      do k=1,20 
!	call cpu_time(start)
      t=0.1*k      ! temperature
      jex=1.      ! exchange parameter
      b=0.        ! electron field
      cont=0
      steps=3000
      grid=8

      write(filename,*) k
      filename='./t'//trim(adjustl(filename))//''
      open(k,file=filename)
      

      do i=1,grid
      do j=1,grid
      lattice(i,j)=1
      end do
      end do

      call random_seed()
      do i=1,32
      call random_number(randomx)
      call random_number(randomy)
      randomx=randomx*grid+1
      randomy=randomy*grid+1

      lattice(int(randomx),int(randomy))=-1
      end do                            ! now we have the lattice

      call hamil(grid,jex,b,lattice,mag,h1)
      summationh=h1
      mag=abs(mag)
      summationm=mag
      cont=1
	h1=h1/(grid**2)
	mag=mag/(grid**2)
      write(k,*) "steps:",cont,"Hamiltonian:",h1,"Magnetization:",mag
      

      10 continue
      call random_number(randomx)
      call random_number(randomy)
      randomy=randomy*grid+1
      randomx=randomx*grid+1
      lattice(int(randomx),int(randomy))=-1*lattice(int(randomx),int(randomy))

      call hamil(grid,jex,b,lattice,mag,h2)
      mag=abs(mag)

      if (h2 .le. h1) then
              !cont=cont+1
              summationh=summationh+h2
              summationm=summationm+mag
              h1=h2
      else 
              call random_number(tmp)
              if (tmp .lt. r(h1,h2,t)) then
              !        cont=cont+1
                      summationh=summationh+h2
                      summationm=summationm+mag
              else
                      lattice(int(randomx),int(randomy))=-1*lattice(int(randomx),int(randomy))
              end if
      end if
     
	cont=cont+1
	h2=h2/(grid**2)
	mag=mag/(grid**2)
      write(k,*) "steps:",cont,"Hamiltonian:",h2,"Magnetization:",mag
      if (cont .lt. steps) goto 10
      
      close(k)
       
!      averageh=summationh/steps
!      averageh=averageh/(grid**2)
!      averagem=summationm/steps
!	averagem=averagem/(grid**2)
!	call cpu_time(finish)
!      print* ,"temperature:",t,"electronic_field:", b,averageh,averagem,"cpu_time:",finish-start

      end do

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
        real(8) :: lattice(8,8),h,jex,b,summation1,mag        !这里x没有问题？
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


        do i=1,grid
        do j=1,grid
        s0=lattice(i,j)
        mag=mag+efield(s0)
        end do
        end do

        summation1=summation1/2
        h=-jex*summation1-b*mag
        
end subroutine hamil

