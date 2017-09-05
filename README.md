# Project Euler

Put your solution to `/problems` folder.

The pattern of `.rb` file for solve the Euler Problem:

```
    require_relative 'euler_problem'

    class Problem001 < EulerProblem
      def self.solve!
        super do
          ...
        end
      end
    end

    Problem001.solve!
```

