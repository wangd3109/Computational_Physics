program e1
        implicit none
        real :: three_points,two_points_1,two_points_2,five_points,d1,d2_1,d2_2,d3,exact,x,h
        integer :: j
        x=1
        exact=cos(x)
!        print*,'enter value of h (le 0 to stop)'
!        read*, h
        do j=1,50000,2000
        h=j*0.00001

        three_points=(sin(x+h)-sin(x-h))/(2*h)
        two_points_1=(sin(x+h)-sin(x))/h
        two_points_2=(sin(x)-sin(x-h))/h
        five_points=(sin(x-2*h)-8*sin(x-h)+8*sin(x+h)-sin(x+2*h))/(12*h)

        d1=exact-three_points
        d2_1=exact-two_points_1
        d2_2=exact-two_points_2
        d3=exact-five_points

        print*, "h:",h,"three_points:",d1,"d2_forward:",d2_1,"d2_backward:",d2_2,"five points:",d3
        end do
end program e1
