program ex2
        implicit none
        real :: x,h,y,exact,p,summation1,summation2,summation3,diff1,diff2,diff3
        integer :: i,n,j,k 
        real,external :: f_1,f_2,f_3

        exact=exp(1.)-1
        do i=1,10,1
        !i=6
        n=4*i
        h=1.0/(2*n)
        p=1./n
        x=1.0/(2*n)
        y=0.0
        summation1=f_1(x,h)
        summation2=f_2(x,h)
        summation3=f_3(y,h)
        print*,"test1,",summation3

        do j=1,n-1,1
!        print*,f_1(x,h),f_1(x+p,h),"sum:",summation
        summation1=summation1+f_1(x+p,h)
        summation2=summation2+f_2(x+p,h)
        x=x+p
        
        end do
        
        do k=0,n-4,4
!        print*,"k",k,summation3
        summation3=summation3+f_3(y+p,h)
        y=y+4*p
!        print*,summation3
        end do

        diff1=summation1-exact
        diff2=summation2-exact
        diff3=summation3-exact
        print*,"n=",n,"trapezoidal:",summation1,diff1,"simpson:",summation2,diff2,"bode:",summation3,diff3
        end do
!        x=0
!        print*,f_3(x,h)
!        x=0.5
!        print*,f_3(x,h)
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

real function f_3(x,h)
        implicit none
        real :: x,h
        f_3=(7*exp(x)+32*exp(x+h)+12*exp(x+2*h)+32*exp(x+3*h)+7*exp(x+4*h))*(2*h/45)
end function

