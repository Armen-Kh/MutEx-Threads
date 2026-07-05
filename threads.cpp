#include <iostream>
#include <pthread.h> // POSIX thread

const int N = 1'000'000;
const int M = 10;
int arr[N];
// Race condition
int sum = 0;

pthread_t threads[M];
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void* calculate_sum(void* param)
{
    int num = *static_cast<int*>(param);
    //std::cerr << "num=" << num << std::endl;
    int local_sum = 0;
    for (int i = num*(N/M); i < (num + 1)*(N/M); ++i)
    {
        local_sum += arr[i];
    }
    pthread_mutex_lock(&mutex);
    sum += local_sum;
    pthread_mutex_unlock(&mutex);
    return nullptr;
}

int main()
{
    // Initialize with 1s
    for (int i = 0; i < N; ++i)
    {
        arr[i] = 1;
    }

    int *params = new int[M];
    for (int i = 0; i < M; ++i)
    {
        params[i] = i;
        pthread_create(&threads[i], nullptr, calculate_sum, &params[i]);
    }

    for (int i = 0; i < M; ++i)
    {
        pthread_join(threads[i], nullptr);
    }

    pthread_mutex_destroy(&mutex);

    std::cout << "Sum : " << sum << std::endl;
    std::cout << "Is sum corect: " << (sum == N ? "Yes" : "No") << std::endl;

    return 0;
}