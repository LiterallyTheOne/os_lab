#include <iostream>
#include <vector>

int main()
{
    size_t gigabytes = 1;                                      // Adjust this value to control memory consumption
    size_t bytes_to_allocate = gigabytes * 1024 * 1024 * 1024; // Convert GB to Bytes

    try
    {
        std::vector<char> memory(bytes_to_allocate, 1); // Allocate memory and initialize it

        std::cout << "Allocated " << gigabytes << "GB of memory." << std::endl;
        std::cout << "Press Enter to exit..." << std::endl;

        std::cin.get(); // Keep the program running
    }
    catch (const std::bad_alloc &e)
    {
        std::cerr << "Memory allocation failed: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}