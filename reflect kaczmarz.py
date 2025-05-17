import numpy as np
def reflect_kaczmarz(A, b, x, max_iter=1000):
    m, n = A.shape
    X = []
    sol = np.zeros(n)
    for i in range(max_iter):
        j=i%m
        a_j = A[j]
        b_j = b[j]
        x = x + 2*(b_j - a_j.dot(x)) * a_j / (a_j.dot(a_j))
        X.append(x)
    for k in range(len(X)):
        sol+=X[k]
    sol=sol/len(X)
    res=np.linalg.norm(A @ sol- b)
    return sol,res

A = np.array([[1, 2, 3], [0, 4, 5], [0, 0, 6]], dtype=float)
b = np.array([3, 7, 11], dtype=float)
x=np.array([0,0,0])
X,E = reflect_kaczmarz(A, b, x)
print("解向量:", X , "误差:", E)

def random_reflect_kaczmarz(A, b, x, max_iter=100000):
    m, n = A.shape
    X = []
    sol = np.zeros(n)
    row_norm=np.sum(A**2,axis=1)
    total_norm=np.sum(row_norm)
    probability=row_norm/total_norm
    for _ in range(max_iter):
        jdx=np.random.choice(m,p=probability)
        a_j = A[jdx]
        b_j = b[jdx]
        x = x + 2*(b_j - a_j.dot(x)) * a_j / (a_j.dot(a_j))
        X.append(x)
    for k in range(len(X)):
        sol+=X[k]
    sol=sol/len(X)
    res=np.linalg.norm(A @ sol- b)
    return sol,res

A = np.array([[1, 2, 3], [0, 4, 5], [0, 0, 6]], dtype=float)
b = np.array([3, 7, 11], dtype=float)
x=np.array([0,0,0])
X,E = random_reflect_kaczmarz(A, b, x)
print("解向量:", X , "误差:", E)


# def random_reflect_kaczmarz(A, b, x, max_iter=1000000):
#     m, n = A.shape
#     X = []
#     sol = np.zeros(n)
#     row_norm=np.sum(A**2,axis=1)
#     total_norm=np.sum(row_norm)
#     probability=row_norm/total_norm
#     for k in range(1,max_iter+1):
#         jdx=np.random.choice(m,p=probability)
#         a_j = A[jdx]
#         b_j = b[jdx]
#         residual = b_j - a_j.dot(x)
#         step = 2 * residual / row_norm[jdx]
#         x_new = x + step * a_j
#         sol = ((k - 1) * sol + x_new) / k
#         x = x_new
#         res = np.linalg.norm(A @ sol - b)
#     return sol, res
#
# A = np.array([[1, 2, 3], [0, 4, 5], [0, 0, 6]], dtype=float)
# b = np.array([3, 7, 11], dtype=float)
# x=np.array([0,0,0])
# X,E = random_reflect_kaczmarz(A, b, x)
# print("解向量:", X , "误差:", E)