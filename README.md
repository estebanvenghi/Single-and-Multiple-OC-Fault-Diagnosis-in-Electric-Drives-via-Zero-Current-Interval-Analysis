# Single and Multiple Open-Switch Fault Diagnosis in Electric Drives via Zero-Current Interval Analysis

ID 9957 - IEEE Latin America Transactions 

Experimental data and scripts to reproduce obtained results. 

#### Authors:
- Luis E. Venghi,
- Facundo Aguilera, 
- Pablo M. de la Barrera,
- Cristian H. De Angelo

#### Affiliation:
Luis Venghi is from Centro de Investigación y Transferencia (CIT) Rafaela, 
UNRaf-CONICET, Santa Fe, Argentina. (e-mail: luisesteban.venghi@unraf.edu.ar).

Facundo Aguilera, Pablo de la Barrera, and Cristian De Angelo are from Grupo de
Electrónica Aplicada (GEA), Instituto de Investigaciones en Tecnologías Energéticas y 
Materiales Avanzados (IITEMA), UNRC-CONICET, Córdoba, Argentina.
(e-mail: faguilera@ing.unrc.edu.ar; pbarrera@ing.unrc.edu.ar; cdeangelo@ing.unrc.edu.ar).

#### Abrtract:
This work proposes a strategy for fault detection and isolation in inverter switches. 
The results demonstrate the effectiveness of the proposed diagnosis method under different operating conditions, 
both with and without inverter switches faults.


## How to execute main results:

(Note that MATLAB R2012 or a higher version is required).

1- To reproduce the main results, from `Experimental results` folder, first run the MATLAB script named “leer_ensayo_X_f.m.” 
Then, execute the file “generico_f.xls.” Finally, run the MATLAB script “graficar_ENSAYOX_f.m.”

2- For proper execution, make sure to set the working directory to the folder that contains these files, 
along with the documentation available in the “Datos” folder. 
Note that the “Datos” folder also includes the experimental datasets 
and the MATLAB script “param_MI_LV.m,” which defines the parameters of the motor used in the experiments.

Note: 
- ENSAYO 1 and 2 evaluate the FDI under a sudden change in load torque at constant speed and under a speed variation test with constant load torque, respectively.
- ENSAYO 3–5 assess the effectiveness of the proposed FDI strategy in diagnosing different inverter switch fault types.


## Other files description

#### Scripts
  
`test_detection_times.m`: provides the positive half-cycle of one phase current under nominal operating conditions, along with the instant at which the average current value falls below the selected threshold due to the occurrence of a fault, thereby defining the diagnostic time window.

`detection_time.m`: reports the fault detection time, expressed as a percentage of the electrical cycle, as a function of the angular instant at which the fault occurs, for four diagnostic index thresholds: 10%, 25%, 50%, and 75%.


#### Comparison with other proposals

Folder `Comparison_with_Trabelsi2017` contains the files `test_trabelsi_fig14.mat` and `test_trabelsi_filtered_fig15` with the experimental data required to obtain Fig. 14 and Fig. 15, respectively. 
