import numpy as np
# 概率取为行向量范数
def randomized_kaczmarz(A, b, x, max_iter=1000, tol=1e-6):
    m, n = A.shape
    row_norms = np.sum(A ** 2, axis=1)
    total_norm = np.sum(row_norms)
    probability = row_norms / total_norm
    X=list()
    E=list()
    for _ in range(max_iter):
        idx = np.random.choice(m, p=probability)
        a_i = A[idx]
        b_i = b[idx]
        x = x + (b_i - a_i.dot(x)) * a_i / (a_i.dot(a_i))
        X.append(x)
        E.append(np.linalg.norm(A @ x - b))
        if np.linalg.norm(A @ x - b) < tol:
            break
    return X,E
A = np.array([[1, 2], [3, 4], [5, 6]], dtype=float)
b = np.array([3, 7, 11], dtype=float)
x=np.array([0,0])
X,E = randomized_kaczmarz(A, b, x)
print("解向量:", X[-1] , "误差:", E[-1])

# 概率取为残差
def randomized_kaczmarz(A, b, x, max_iter=1000, tol=1e-6):
    m, n = A.shape
    X = []
    E = []
    for _ in range(max_iter):
        residual = abs(A @ x - b)
        total_res = np.sum(residual)
        probabilities = residual / total_res
        idx = np.random.choice(m, p=probabilities)
        a_i = A[idx]
        b_i = b[idx]
        x = x + (b_i - a_i.dot(x)) * a_i / (a_i.dot(a_i))
        X.append(x)
        E.append(np.linalg.norm(A @ x - b))
        if np.linalg.norm(A @ x - b) < tol:
            break

    return X,E
A = np.array([[1, 2], [3, 4], [5, 6]], dtype=float)
b = np.array([3, 7, 11], dtype=float)
x=np.array([0,0])
X,E = randomized_kaczmarz(A, b, x)
print("解向量:", X[-1] , "误差:", E[-1])


