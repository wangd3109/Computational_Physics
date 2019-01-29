program ex32
        implicit none
        real :: x,tolerance,exact,error
        integer :: cont
        real, external :: f_1,f_2

        cont=1
        x=1.
        tolerance=1.e-05
        exact=sqrt(5.)
        
        10 continue
        cont=cont+1
        x=x-f_1(x)/f_2(x)
        error=exact-abs(x)
        print*, cont,x,abs(error),abs(x)
        if (abs(error) .gt. tolerance) goto 10
        stop
        


end program ex32

real function f_1(x)
        real :: x
        f_1=x**2-5
end function

real function f_2(x)
        real :: x
        f_2=2*x-5
end function
