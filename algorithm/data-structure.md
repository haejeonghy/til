# Data Structure

## Stack

* LIFO Last In First Out
* FILO First In Last Out
* data를 순서대로 쌓는 자료 구조
  
``` javascript
// 배열을 Stack처럼 사용하기
const stack = []; 

stack.push(1); // [1]
stack.push(2); // [1, 2]
stack.push(3); // [1, 2, 3]
stack.push(4); // [1, 2, 3, 4]
stack.push(5); // [1, 2, 3, 4, 5]

console.log(stack); // [1, 2, 3, 4, 5]

stack.pop(); // [1, 2, 3, 4]
stack.pop(); // [1, 2, 3]

console.log(stack); // [1, 2, 3]
```

## Queue

* FIFO First In First Out
* LILO Last In Last Out
* 먼저 들어간 data가 먼저 나오는 자료 구조

``` javascript
// 배열을 queue처럼 사용하기
const queue = []; 

queue.push(1); // [1]
queue.push(2); // [1, 2]
queue.push(3); // [1, 2, 3]
queue.push(4); // [1, 2, 3, 4]
queue.push(5); // [1, 2, 3, 4, 5]

console.log(queue); // [1, 2, 3, 4, 5]

queue.shift(); // [2, 3, 4, 5]
queue.shift(); // [3, 4, 5]

console.log(queue); // [3, 4, 5]
```

## Graph

* 여러 개의 점들이 서로 복잡하게 연결되어 있는 관계 표현한 자료 구조
  
* Edge 간선 : 직접적인 관계가 있는 두 점 사이를 이어주는 선
* Vertex 정점 : 하나의 점
* 비가중치 그래프
  * 추가적인 정보를 파악할 수 없는 그래프
  * 간선에 가중치가 포함되지 않은 그래프
* 가중치 그래프
  * 간선에 가중치가 포함된 그래프
  * 연결 정도를 표현한 그래프
* 무방향 그래프 Undirected graph : 방향이 정해지지 않은 그래프
* 단방향 그래프 Directed Graph : 방향이 정해진 그래프
* 진입 차수 in-degree : 한 정점에 들어오는 간선의 수
* 진출 차수 out-degree : 한 정점에서 나가는 간선의 수
* 인접 adjacency : 사이에 간접이 직접 이어져 있는 두 정점의 관계
  * 인접 행렬
    * 두 정점이 이어져 있다면 1(true), 아니라면 0(false)로 입력한 행렬
    * 가중치 그래프의 경우 가중치를 입력한 행렬
    * 두 정점 사이의 관계 유무 파악에 용이하다. 
    * 가장 빠른 경로를 찾을 때 주로 사용한다. 
  * 인접 리스트
    * 각 정점이 어떤 정접과 인접한지를 표현한 리스트
    * 정점마다 하나의 리스트를 가지고 있고, 자신과 인접한 다른 정점을 가지고 있다. 
    * 메모리를 효율적으로 사용하고 싶을 때 사용한다. 
* 자기 루프 self loop : 정점에서 진출하는 간선이 곧바로 자기 자신에게 진입하는 경우
* 사이클 cycle : 한 정점에서 출발하여 다시 해당 정점으로 돌아갈 수 있는 경우


### BFS

* Breadth-First Search
* 너비 우선 탐색
* 가까운 정점부터 탐색한다. 
* 두 정점 사이의 최단 경로를 찾을 떄 사용한다. 
* 최악의 경우에는 모든 경로를 살펴보아야 한다. 

### DFS

* Depth-First Search
* 깊이 우선 탐색
* 하나의 경로를 끝까지 탐색한 후 목적을 달성하지 못하면 다음 경로로 넘어간다. 
* 탐색 시간은 조금 오래 걸려도 모든 node를 완전히 탐색할 수 있다. 

## Tree

* data가 바로 아래에 있는 하나 이상의 data에 무방향으로 연결된 계층적 자료 구조
* 하나의 data 뒤에 여러 개의 data가 존재할 수 있는 비선형 구조
* 계층적으로 표현이 되고, 아래로만 뻗어나가기 때문에 사이클이 없다. 
* 루트 root : 꼭짓점 data
* 간선 edge : node를 연결한 선
* node node : 간선으로 연결된 각 data
* 부모 node parent node : 한 node와 연결된 상위 data
* 자식 node child node : 한 node와 연결된 하위 data
* 리프 node leaf node : 자식이 없는 node
* 깊이 depth : 루트부터 하위 계층의 특정 node까지의 깊이 
  * 루프 node는 깊이가 0이다. 
* 레벨 level : 같은 깊이를 가지고 있는 node를 묶어서 레벨로 표현한다. 
* 형제 node sibling node : 같은 레벨에 나란히 있는 node
* 높이 height :리프 node를 기준으로 루트까지의 높이
* 서브 트리 sub tree : 루트에서 뻗어나오는 큰 트리의 내부에 트리 구조를 갖춘 작은 트리
  
### Binary Tree

* 이진 트리
* 자식 node가 최대 두 개인 node들로 구성된 트리
* 정 이진 트리 full binary tree
  * 각 node가 0 개, 혹은 2 개의 자식 node를 갖는 트리
* 완전 이진 트리 complete binary tree
  * 마지막 레벨을 제외한 모든 node가 가득 차 있는 트리
  * 마지막 레벨의 node는 전부 차 있지 않더라도 왼쪽부터 채워져야 한다. 
* 포화 이진 트리 perfect binary tree
  * 정 이진 트리이면서 완전 이진 트리인 트리
  * 모든 리프 node의 레벨이 동일하다. 
  * 모든 레벨이 가득 채워져 있다. 

### Binary Search Tree

* 이진 탐색 트리
* 모든 왼쪽 자식의 값이 루트나 부모보다 작다.
* 모든 오른쪽 자식의 값이 루트나 부모보다 크다.

### Tree traversal

* 트리 순회
* 특정 목적을 위해 트리의 모든 node를 한 번씩 방문하는 것
* 전회 순회
  * preorder
  * 루트에서 시작해 왼쪽의 node를 순차적으로 둘러본다.
  * 왼쪽의 node 탐색이 끝나면 오른쪽 node를 탐색한다. 
* 중위 순회
  * inorder
  * 루트를 가운데 두고 순회한다.
  * 왼쪽 끝에 있는 node에서부터 순회하기 시작한다.
  * 루트를 기준으로 왼쪽에 있는 node의 순회가 끝나면 루트를 거쳐 오른쪽에 있는 node로 이동하여 탐색한다. 
* 후위 순회
  * Postorder
  * 루트를 가장 마지막에 순회한다. 
  * 제일 왼쪽 끝에 있는 node부터 순회하기 시작한다.
  * 루트를 거치지 않고 오른쪽으로 이동해 순회한 뒤 제일 마지막에 루트를 방문한다. 

### Heap

* 완전 이진 트리의 일종
* 우선 순위 큐를 위하여 만들어진 자료구조이다. 
* 여러 개의 값 중에서 최댓값이나 최솟값을 빠르게 찾아내도록 만들어졌다. 
* 반정렬 상태를 유지한다. 
  * 부모 node의 키 값이 자식 node의 키 값보다 항상 큰 이진 트리를 말한다. 
* 중복된 값을 허용한다. 

## Linked-list

* 메모리 상에 index에 의한 물리적 배치를 하지 않는다.
* node를 생성 후 해당 node의 포인터에 의해 다음 node를 연결한다. 
* data 삽입/삭제 시 data의 구조를 재정렬하지 않아도 된다.
* 배열 보다 많은 메모리를 사용한다.
* 특정 data를 검색 시 비효율적이다. 

## Hash Table

* 어떤 특정 값을 받으면 그 값을 해시 함수에 통과시켜 나온 index에 저장하는 자료 구조이다.