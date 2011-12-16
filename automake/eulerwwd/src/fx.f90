SUBROUTINE FX(CVF)
USE DAMOD
USE FD
INTEGER::A,B,SIGN
REAL::FLUX(4),CVF(4,NCELLS),WT(4)
FLUX=0.
CVF=0.
DO I=1,NEDGES
	A=EDGE(1,I)
	B=EDGE(2,I)
	J=EDGE(3,I)
	K=EDGE(4,I)
	SIGN=EDGE(5,I)
  IF(SIGN==0)THEN
    WT(:)=0.5*(W(:,J)+W(:,K))
   ELSEIF(SIGN==1)THEN
    WT(:)=W(:,J)
  ELSE
    CALL BOUNDARY(WT,I)
  ENDIF
    DEN=WT(1)
	U=WT(2)/WT(1)
	V=WT(3)/WT(1)
!	if(sign==0)then
!	u=0.
!	v=0.
!	endif
	E=WT(4)/WT(1)
    H=E+(GAMA-1)*(E-0.5*(U**2+V**2))
	P=DEN*(H-E)
	SONIC(I)=SQRT(GAMA*(H-E))
	DX=NODE(1,B)-NODE(1,A)
	DY=NODE(2,B)-NODE(2,A)
	Z(I)=U*DY-V*DX
 IF(SIGN.EQ.1)Z(I)=0.
    FLUX(1)=DEN*Z(I)
	FLUX(2)=DEN*Z(I)*U+P*DY
	FLUX(3)=DEN*Z(I)*V-P*DX
	FLUX(4)=DEN*Z(I)*H
	CVF(:,J)=CVF(:,J)+FLUX(:)
	IF(SIGN.EQ.0)THEN
    CVF(:,K)=CVF(:,K)-FLUX(:)
	ENDIF 
ENDDO
END