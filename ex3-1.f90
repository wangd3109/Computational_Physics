program ex3
        implicit none
        real :: init,root,tolerance,error,x,h,mediate
        integer :: cont
        real, external :: f_1

        cont=1
        x=1.
        h=0.05
        tolerance=1.e-05
        mediate=f_1(x)
        x=x+h


        10 continue
        cont=cont+1
        x=x+h
!        print*,cont,x,f_1(x),h
        if ((mediate*f_1(x)) .lt. 0) then
                x=x-h
                h=h/2
        end if
        if (abs(h) .gt. tolerance) goto 10
        print*, cont, x,h
!        stop


end program ex3

real function f_1(x)
        real :: x
        f_1=x**2-5
end function

