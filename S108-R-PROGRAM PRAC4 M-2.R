print("--- 4. One-Sample t-test (Elevator Wait Time) ---")

elev <- read.csv("elevator_traffic.csv")

# Question: Is the average wait_time_seconds significantly different from 10 seconds?

t_test_wait <- t.test(elev$wait_time_seconds, mu = 10)

print(t_test_wait)

