! Copyright (c) 2016, 2017  Robert Rüger
!
! This file is part of of the Fortran Template Library.
!
! The Fortran Template Library is free software: you can redistribute it and/or
! modify it under the terms of the GNU Lesser General Public License as
! published by the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.
!
! The Fortran Template Library is distributed in the hope that it will be
! useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser
! General Public License for more details.
!
! You should have received a copy of the GNU Lesser General Public License along
! with the Fortran Template Library.  If not, see <http://www.gnu.org/licenses/>.


subroutine sortDynArrayInt(n)

   use ftlTestToolsModule
   use ftlDynArrayIntModule
   use ftlDynArrayIntAlgorithmsModule

   integer, intent(in) :: n

   type(ftlDynArrayInt) :: v
   real :: start, finish

   call v%New(n)
   call ftlGenerate(v%Begin(), v%End(), RandomInt)

   call cpu_time(start)
   call ftlSort(v)
   call cpu_time(finish)

   write (*,'(A,I10,A,f7.3,A)') 'Sorted ftlDynArrayInt: ',n,' elements in ',(finish-start),' s'

end subroutine


program main

   call sortDynArrayInt(10000)
   call sortDynArrayInt(100000)
   call sortDynArrayInt(1000000)
   call sortDynArrayInt(10000000)
   call sortDynArrayInt(100000000)

end program
