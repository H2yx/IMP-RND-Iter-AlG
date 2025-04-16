import numpy as np
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = ['SimHei']  # 指定黑体或其他中文字体[1,5](@ref)
plt.rcParams['axes.unicode_minus'] = False     # 解决负号显示为方框的问题[1,5](@ref)
plt.rcParams['font.sans-serif'] = ['Microsoft YaHei']  # 或 'SimHei', 'Source Han Sans CN'
plt.rcParams['axes.unicode_minus'] = False  # 强制使用ASCII短横线"-"替代Unicode负号
def Kaczmarz(A,b,tol,max_iter):
    X=list()
    E=list()
    m,n=np.shape(A)
    x = np.zeros(n)
    for i in range(max_iter):
      j=i%m
      x=x+(b[j]-A[j].dot(x))*A[j]/(A[j].dot(A[j]))
      X.append(x)
      E.append(np.linalg.norm(A@x-b))
      if np.linalg.norm(A @ x - b) < tol:
          break
    return X,E

tol =1e-5
max_iter=1000
A = np.array([[1, 2], [3, 4], [5, 6]], dtype=float)
b = np.array([3, 7, 11], dtype=float)
X, E = Kaczmarz(A, b, tol,max_iter)
print("解为：",X[-1],"残差为：",E[-1])




