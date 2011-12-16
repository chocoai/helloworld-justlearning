program main
 use damod
 use fd
 print*,'cell_center(cc) or cell_vertex(cv)?'
 read(*,*)cv
if(cv=='cv')open(10,file='cvine.dat')  
if(cv=='cc')open(10,file='ccine.dat')  
    read(10,*)nnodes,ncells,nedges
	allocate(node(2,nnodes));allocate(w(4,ncells));allocate(inir(4,ncells))
	allocate(res(4,ncells));allocate(edge(5,nedges));allocate(sonic(nedges))
    allocate(z(nedges))
	read(10,*)((node(j,i),j=1,2),i=1,nnodes) 
	read(10,*)((edge(j,i),j=1,5),i=1,nedges)
close (10)
open(10,file='ccine.dat')
  read(10,*)nde,nel,neg
  print*,'mesh data:      ',nde,nel,neg
  allocate(mend(2,nde));allocate(meeg(5,neg));allocate(cell(3,nel))
  read(10,*)((mend(j,i),j=1,2),i=1,nde)
  read(10,*)((meeg(j,i),j=1,5),i=1,neg)
  read(10,*)((cell(j,i),j=1,3),i=1,nel)
  close(10)
   call meshow
! ---------input---------------------------
    wendu8=288.
	p8=1.e5
    den8=p8/(gasc*wendu8)
    sonic8=sqrt(gama*gasc*wendu8)
	alpha=0.*tt/180.
	u8=cos(alpha)*sonic8*mach
	v8=sin(alpha)*sonic8*mach
	e8=p8/(0.4*den8)+0.5*(u8**2+v8**2)
	w18=den8
	w28=den8*u8
	w38=den8*v8
	w48=den8*e8
!-----------------------------------------
!pause
	call temporal
7     format(i7)
87    format(4e15.7)
400   format(5i7)
end
