! Reseni linearni algebraicke soustavy A.x=b operatorem .linsolve.
! Implementace pomoci receptu gaussj
! Vetsi matice A (pro radove vterinovy beh gaussj: nmax~1000)
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
integer,parameter :: NMAX=1000,NOUT=3
real(rp) A(NMAX,NMAX),b(NMAX),x(NMAX)
call random_number(A)   ! matice nahodnych cisel
b=1.                    ! vektor prave strany
print *,'nmax =',nmax
x=A.linsolve.b
print *,'x =',x(1:NOUT) ! zacatek vektoru reseni
b=matmul(A,x)           ! zkouska
print *,'b =',b(1:NOUT) ! zacatek vektoru prave strany
end program
