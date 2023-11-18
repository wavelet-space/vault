! Reseni linearni algebraicke soustavy A.x=b operatorem .linsolve.
! Implementace pomoci receptu gaussj
! Mala matice A (nmax=2)
! Preklad: gfortran -O3 file.f90; ifort -O3 file.f90

! vlozeni souboru s numerickym receptem
include 'dgaussj.f'

! modul s implementaci operatoru .linsolve.
module mLinsolve
implicit none

integer,parameter :: rp=8  ! real precision single (4) or double (8)

interface operator (.linsolve.)
module procedure linsolve
end interface

contains

function linsolve(A,b) result (result)
real(rp),intent(in) :: A(:,:),b(:)  ! argumenty zastupujici operandy operatoru musi byt read only
real(rp),allocatable :: result(:),Ainv(:,:)
! real(rp) result(size(A,1)),Ainv(size(A,1),size(A,2))  ! alternativa pomoci automatickych poli (riziko stack overflow)
integer n,np,m,mp
n=size(A,1)
np=n
m=1
mp=1
Ainv=A    ! backup, nebot resic prepisuje matici jeji inverzi
result=b  ! resic prepisuje argument s vektorem prave strany
call gaussj(Ainv,n,np,result,m,mp)
end function

end module

program testLinsolve
use mLinsolve
implicit none
integer,parameter :: nmax=2
real(rp) A(nmax,nmax),b(nmax),x(nmax)
A(1,:)=[0,1]  ! matice zadavana po radcich
A(2,:)=[1,0]
b=[1,1]       ! vektor prave strany
print *,'nmax =',nmax
x=A.linsolve.b
print *,'x =',x     ! vektor reseni
print *,'b =',matmul(A,x)  ! zkouska
end program
