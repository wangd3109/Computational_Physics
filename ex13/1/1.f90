program ex13 ! test the git log command
        implicit none
        real ::x,y,ratio,totaln,cont
        integer :: i

        call random_seed()
        do i=1,100000
        totaln=totaln+1
        call random_number(x)
        call random_number(y)
        print*,x,y
        if (x**2+y**2 .lt. 1) then
                cont=cont+1
        end if

        end do
        ratio=4*(cont/totaln)
        print*,ratio

end program ex13

