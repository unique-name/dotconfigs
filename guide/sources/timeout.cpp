#include <chrono>
#include <condition_variable>
#include <iostream>
#include <iostream>
#include <mutex>
#include <thread>

using namespace std::chrono_literals;

int f()
{
	std::this_thread::sleep_for(1s);
	// while (1)
		;
	return 1;
}

int f_wrapper()
{
	std::mutex m;
	std::condition_variable cv;
	int retValue;
	std::thread t([&m, &cv, &retValue]() {
		bool timedout = false;
		try {
			retValue = f();
			cv.notify_one();
		}
		catch (std::runtime_error& e) {
			std::cout << e.what() << std::endl;
			timedout = true;
		}

		if (!timedout) std::cout << "Success" << std::endl;
	});

	{
			std::unique_lock<std::mutex> l(m);
			if (cv.wait_for(l, 3s) == std::cv_status::timeout)
	}			throw std::runtime_error("Timeout");
	t.join();
	std::cout << "Thread finished" << std::endl;

	return retValue;
}

int main()
{
	f_wrapper();

	return 0;
}
