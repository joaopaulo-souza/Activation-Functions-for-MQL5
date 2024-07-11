//+------------------------------------------------------------------+
//|    Activation Functions                                          |
//+------------------------------------------------------------------+

matrix Sig(matrix &X)
{
matrix M;
M = X;
for(int i=0;i<M.Rows();i++)
  {for(int j=0;j<M.Cols();j++)
     {M[i][j] = 1.0/(1.0 + MathExp((-1)*M[i][j]));}}
     
return M;
      
}
matrix Tanh(matrix &X)
{
matrix M;
M = X;
for(int i=0;i<M.Rows();i++)
  {for(int j=0;j<M.Cols();j++)
     {M[i][j] = (MathExp(M[i][j])-MathExp((-1.0)*M[i][j]))/(MathExp(M[i][j])+MathExp((-1.0)*M[i][j]));}}
     
return M;
}
matrix ReLU(matrix &X)
{
matrix M;
M = X; 
for(int i=0;i<M.Rows();i++)
  {for(int j=0;j<M.Cols();j++)
     {if(M[i][j] > 0) M[i][j] = M[i][j];
      if(M[i][j] <=0) M[i][j] = 0.01*M[i][j];}}

return M;     
}

matrix dSig(matrix &X)
{
matrix M;
M = X; 

M = Sig(M);
for(int i=0;i<M.Rows();i++)
  {for(int j=0;j<M.Cols();j++)
     {M[i][j] = M[i][j]*(1.0 - M[i][j]);}}

return M;  
}
matrix dTanh(matrix &X)
{
matrix M;
M = X; 

M = Tanh(M);
for(int i=0;i<M.Rows();i++)
  {for(int j=0;j<M.Cols();j++)
     {M[i][j] = (1.0 - M[i][j]*M[i][j]);}}

return M;  
}
matrix dReLU(matrix &X)
{
matrix M;
M = X;
for(int i=0;i<M.Rows();i++)
  {for(int j=0;j<M.Cols();j++)
     {if(M[i][j] > 0) M[i][j] = 1;
      if(M[i][j] <= 0) M[i][j] = 0.01;}}
      
return M;
}