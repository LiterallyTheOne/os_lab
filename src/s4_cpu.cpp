#include <iostream>
#include <thread>
#include <chrono>

int main()
{
    while (1)
    {
        for (int i = 0; i < 1000000; i++)
        {
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }

    return 0;
}