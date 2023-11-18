/*

## Compilation
	
	clang -std=c++17 -lstdc++ -o bubble_sort bubble_sort.cpp

## Description

The *bubble sort* algorithm also known as *sinking sort* is simple
algorithm which sorts the input sequence of items.


## Performance

- Time complexity: O()
- Space complexity: O()

## C++ Features

- The function template.

## Examples 

||5|| 4 | 3 | 2 | 1 |
| 4 ||5|| 3 | 2 | 1 |
| 4 | 3 ||5|| 2 | 1 |
| 4 | 3 | 2 ||5|| 1 |
| 4 | 3 | 2 | 1 ||5||
| 3 ||4|| 2 | 1 |...|
| 3 | 2 ||4|| 1 |...|
| 3 | 2 | 1 ||4||...|
| 2 ||3|| 1 |...|...|
| 2 | 1 ||3||...|...|
| 1 ||2||...|...|...|

*/

#include <algorithm> // std::swap
#include <initializer_list>
#include <iostream>
#include <vector>

/*
 * Simple swap implementation.
 *
 * \tparam T The type of items to be swapped.
 */
template <typename T> void swap(T &lhs, T &rhs) {
  T tmp{lhs};
  lhs = rhs;
  rhs = tmp;
}

/**
 * \brief Sort the sequence of numbers in asccending order.
 *
 * \param xs The sequence of items.
 * \tparam T The sequence item type.
 */
template <typename T>
std::vector<T> bubble_sort(std::initializer_list<T> const &xs) {
  std::vector<T> output{xs};

  for (int i = 0; i < output.size(); ++i) {
    for (int j = 0; j < output.size() - i - 1; ++j) {

      // DEBUGGING
      // for (auto const &n : output) {
      //   std::cout << n << " ";
      // }
      // std::cout << std::endl;

      if (output[j] > output[j + 1]) {
        // U can use the custom implementation of swap!
        std::swap<T>(output[j], output[j + 1]);
      }

    }
  }
  return output;
}

int main() {

  // Sort the numbers.	
  auto nums = bubble_sort<int>({5, 4, 3, 2, 1});

  for (const auto &x : nums) {
    std::cout << x << " ";
  }
  std::cout << std::endl;

  // Sort the characters.	
  auto chars = bubble_sort<char>({'e', 'd', 'c', 'b', 'a'});

  for (const auto &x : chars) {
    std::cout << x << " ";
  }
  std::cout << std::endl;
}
