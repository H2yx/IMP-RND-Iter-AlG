import numpy as np
import matplotlib.pyplot as plt

plt.rcParams['font.sans-serif'] = ['SimHei']  # 指定黑体或其他中文字体[1,5](@ref)
plt.rcParams['axes.unicode_minus'] = False     # 解决负号显示为方框的问题[1,5](@ref)
plt.rcParams['font.sans-serif'] = ['Microsoft YaHei']  # 或 'SimHei', 'Source Han Sans CN'
plt.rcParams['axes.unicode_minus'] = False  # 强制使用ASCII短横线"-"替代Unicode负号
def Kaczmarz(A,b,x,tol,max_iter):
    X=list()
    E=list()
    m,n=np.shape(A)
    for i in range(max_iter):
      j=i%m
      x=x+(b[j]-A[j].dot(x))*A[j]/(A[j].dot(A[j]))
      X.append(x)
      E.append(np.linalg.norm(A@x-b))
      if np.linalg.norm(A @ x - b) < tol:
          break
    return X,E

# 概率取为行向量范数
def randomized_kaczmarz1(A, b, x, max_iter=1000, tol=1e-6):
    m, n = A.shape
    row_norms = np.sum(A ** 2, axis=1)
    total_norm = np.sum(row_norms)
    probability = row_norms / total_norm
    X=list()
    E=list()
    for _ in range(int(max_iter)):
        idx = np.random.choice(m, p=probability)
        a_i = A[idx]
        b_i = b[idx]
        x = x + (b_i - a_i.dot(x)) * a_i / (a_i.dot(a_i))
        X.append(x)
        E.append(np.linalg.norm(A @ x - b))
        if np.linalg.norm(A @ x - b) < tol:
            break
    return X,E


# 概率取为残差
def randomized_kaczmarz2(A, b, x, max_iter=1000, tol=1e-6):
    m, n = A.shape
    X = []
    E = []
    for _ in range(int(max_iter)):
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

def reflect_kaczmarz(A, b, x, max_iter=1000):
    m, n = A.shape
    X = []
    sol = np.zeros(n)
    for i in range(int(max_iter)):
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

def random_reflect_kaczmarz(A, b, x, max_iter=1000):
    m, n = A.shape
    X = []
    sol = np.zeros(n)
    row_norm=np.sum(A**2,axis=1)
    total_norm=np.sum(row_norm)
    probability=row_norm/total_norm
    for _ in range(int(max_iter)):
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

def greedy_kaczmarz(A, b, x, tol, max_iter):
    m,n=A.shape
    X=[]
    E=[]
    for _ in range(int(max_iter)):
        res = abs(A @ x - b)
        j=np.argmax(res)
        x=x+(b[j]-A[j].dot(x))*A[j]/(A[j].dot(A[j]))
        X.append(x)
        E.append(np.linalg.norm(b-A @ x))
        if np.linalg.norm(A @ x - b) < tol:
            break
    return X, E

tol =1e-5
max_iter=1000
x=np.array([0,0,0])
A = np.array([[1, 2, 3], [0, 4, 5], [0, 0, 6]], dtype=float)
b = np.array([3, 7, 11], dtype=float)




# plt.rcParams['font.sans-serif'] = 'Microsoft YaHei'  # 中文字体
# plt.rcParams['axes.unicode_minus'] = False          # 正常显示负号
# plt.style.use('ggplot')  # 使用内置主题
#
# # ========== 算法模拟数据生成 ==========
# # 示例数据（实际使用时替换为真实残差列表）
# iterations = 100
# E_cyclic = np.logspace(0, -6, num=iterations) * 1.5 + np.random.normal(0, 0.1, iterations)
# E_rand1 = np.logspace(0, -6, num=80) * 0.8 + np.random.normal(0, 0.05, 80)
# E_rand2 = np.logspace(0, -6, num=70) * 0.6 + np.random.normal(0, 0.1, 70)
# E_greedy = np.logspace(0, -6, num=50) * 0.5 + np.random.normal(0, 0.1, 50)
# E_reflect = np.logspace(0, -6, num=iterations) * 1.2 + np.random.normal(0, 0.2, iterations)
# E_rand_reflect = np.logspace(0, -6, num=90) * 0.7 + np.random.normal(0, 0.1, 90)
#
# # ========== 动态填充至相同长度 ==========
# max_len = iterations
# data = {
#     '循环Kaczmarz': (E_cyclic, '#1f77b4', '-', 2.0),
#     '随机Kaczmarz（行范数）': (E_rand1, '#ff7f0e', '--', 2.5),
#     '随机Kaczmarz（残差）': (E_rand2, '#2ca02c', '-.', 2.0),
#     '贪婪Kaczmarz': (E_greedy, '#d62728', ':', 3.0),
#     '反射Kaczmarz': (E_reflect, '#9467bd', (0, (5, 5)), 2.0),
#     '随机反射Kaczmarz': (E_rand_reflect, '#8c564b', (0, (3, 1, 1, 1)), 2.0)
# }
#
# # ========== 绘图 ==========
# plt.figure(figsize=(14, 7))
#
# for label, (E, color, linestyle, lw) in data.items():
#     padded_E = np.concatenate([E, np.full(max_len - len(E), E[-1])])
#     plt.semilogy(padded_E, color=color, linestyle=linestyle, linewidth=lw,
#                  alpha=0.9, label=label, marker='', markersize=4)
#
# # ========== 图表装饰 ==========
# plt.title('Kaczmarz算法收敛性能对比', fontsize=16, pad=20)
# plt.xlabel('迭代次数', fontsize=12)
# plt.ylabel('残差范数（对数尺度）', fontsize=12)
# plt.legend(fontsize=10, frameon=True, shadow=True, loc='upper right')
# plt.grid(True, which='both', alpha=0.4)
# plt.ylim(1e-6, 10)
# plt.xlim(0, max_len-1)
# plt.tight_layout()
# plt.show()


