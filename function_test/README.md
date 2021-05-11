# [Recurrent_Voltage_collapse_in_complex_power_grids](https://github.com/hongshen-zhang/Voltage_collapse_in_complex_power_grids)

![language](https://img.shields.io/badge/language-matlab-green.svg)
![Based](https://img.shields.io/badge/Based-matpower-brightgreen.svg)
---

## Here is the result of paper in both high voltageand AC power flow for case9.

### The result for high voltage power flow is as follow

| node_index | exact_high_voltage_lambda | predict_high_voltage_lambda | error_high |
| :----: | :----: | :----: | :----: |
| 5 | 10.523 | 10.017 | 4.8% |
| 7 | 11.223 | 10.953 | 2.4% |
| 9 | 6.648 | 6.424 | 3.4% |

### The result for AC power flow is as follow

| node_index | exact_ac_lambda | predict_ac_lambda | error_high |
| :----: | :----: | :----: | :----: |
| 5 | 4.309 | 10.017 | 132% |
| 7 | 4.672 | 10.953 | 134% |
| 9 | 3.247 | 6.424 | 98% |


----
The detailed information about the paper can be viewed at 
>Cite information : Simpson-Porco J W, Dörfler F, Bullo F. Voltage collapse in complex power grids[J]. Nature communications, 2016, 7(1): 1-8.

>Paper website : https://www.nature.com/articles/ncomms10790
