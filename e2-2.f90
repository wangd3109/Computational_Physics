program ex2
        implicit none
        real :: x,h,exact,p,summation1,summation2,diff1
        integer :: i,n,j 
        real,external :: f_1,f_2

        exact=exp(1.)-1
!        do i=1,10,1
        i=3
        n=4*i
        h=1.0/(2*n)
        x=1.0/(2*n)
        summation1=f_1(x,h)

        do j=1,n-1,1
        p=1./n
!        print*,f_1(x,h),f_1(x+p,h),"sum:",summation
        summation1=summation1+f_1(x+p,h)
        x=x+p
        
        end do
        diff1=summation1-exact
        print*,"n:",n,"trapezoidal:",summation1,"error:",diff1
!        end do

        summation2=f_2(x,h)
        print*, summation2,f_2(x+h,h)
end program ex2

real function f_1(x,h)
         implicit none
         real,intent(in) ::x,h
         f_1=(exp(x-h)+2*exp(x)+exp(x+h))*h/2
end function

real function f_2(x,h)
        implicit none
        real :: x,h
        f_2=(exp(x-h)+4*exp(x)+exp(x+h))*h/3
end function

