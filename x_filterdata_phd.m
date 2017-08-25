function [f_data]=x_filterdata_phd(raw_data,c_f,wd,f_t,f_s)
%function frequency filter based on parameters
%input  data
%       c_f cutoff frequency ex: [2 50] for band pass
%                                  [10] for high-low pass
%       wd  width drop angle
%       f_t filter type     %(1 low 2 high 3 band 4 none)
%       f_s sampling frequency
%
%output f_data filtered timeseries
filter_parameters.filter_type=f_t; %(1 low 2 high 3 band 4 none)
filter_parameters.SamplingRate=f_s;
filter_parameters.cutoff_frequency=c_f;     
filter_parameters.widthdrop=wd;

[f_data, filter_length]=x_filteringData(raw_data, filter_parameters);
