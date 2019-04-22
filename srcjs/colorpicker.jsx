import { reactShinyInput } from 'reactR';
import * as pickers from 'react-color';

const PickerInput = ({ configuration, value, setValue }) => {
  const picker = pickers[configuration.type];
  return React.createElement(picker, {
    color: value.rgb,
    onChangeComplete: color => setValue
  });
};


reactShinyInput('.colorpicker', 'reactR.colorpicker', PickerInput);
