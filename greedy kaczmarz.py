import numpy as np
def greedy_kaczmarz(A,b,tol,max_iter):
    m,n=A.shape
    x=np.zeros(n)
    X=[]
    E=[]
    res=abs(A@x-b)
    for _ in range(max_iter):
        j=np.argmax(res)
        x=x+(b[j]-A[j].dot(x))*A[j]/(A[j].dot(A[j]))
        X.append(x)
        E.append(np.linalg.norm(b-A @ x))
        if np.linalg.norm(A @ x - b) < tol:
            break
    return X, E
tol =1e-5
max_iter=1000
A = np.array([[1, 2], [3, 4], [5, 6]], dtype=float)
b = np.array([3, 7, 11], dtype=float)
X, E = greedy_kaczmarz(A, b, tol, max_iter)
print("解为：",X[-1],"残差为：",E[-1])
