# MutEx-Threads
POSIX threads

#  Threads vs Processes (Linux / C++ / POSIX)

A concise overview of **processes and threads**, their differences, and core concurrency concepts at the OS level using **POSIX threads (pthreads)** and C++.

---

##  Overview

This project explains fundamental concepts of:
- Processes vs Threads
- Execution model in Linux
- Thread creation with `pthread`
- Shared memory behavior
- Race conditions
- Mutex synchronization

---

##  Process vs Thread

###  Process
- Has its own memory space (isolation)
- Independent execution environment
- Safer but heavier

###  Thread
- Lightweight execution unit inside a process
- Shares memory with other threads
- Faster but requires synchronization

> A process can contain multiple threads.

---

##  Key Concepts

### Execution model
- Each thread starts from a **function pointer**
- Every thread has its own **stack**
- Threads share:
  - Heap
  - Global variables

---

### Main thread
- Every process starts with a **main thread**
- It must wait for other threads:

```cpp
pthread_join(thread, nullptr);

##  Race Condition

A race condition occurs when multiple threads access shared data without proper synchronization.

### Example:

```cpp
sum += arr[i];

##  Race Condition & Atomicity

This operation is **not atomic**, because it consists of multiple steps:

- Load value from memory  
- Add new value  
- Store result back  

If a thread is interrupted between these steps, it can lead to incorrect results due to a **race condition**.

---

##  Mutex (Solution)

A **mutex** is used to protect shared resources and prevent race conditions.

### Example (C / POSIX Threads)

```c
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

pthread_mutex_lock(&mutex);
sum += value;
pthread_mutex_unlock(&mutex);

##  Cleanup

When the mutex is no longer needed, it should be properly destroyed:

```c
pthread_mutex_destroy(&mutex);

##  When to Use

###  Use Processes:
- When strong isolation is required  
- When safety and independence between tasks are critical  
- When memory should not be shared  

###  Use Threads:
- When tasks need to share data  
- When high performance and low overhead are required  
- When communication between tasks is frequent  

---

##  Technologies

- C / C++  
- POSIX Threads (pthreads)  
- Linux OS concepts  

---

##  Summary

- **Processes** = isolation, separate memory space  
- **Threads** = shared memory, lightweight execution  
- **Race condition** = unsafe concurrent access to shared data  
- **Mutex** = synchronization tool to prevent race conditions  
