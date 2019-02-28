import { reactInput } from 'reactR';
import * as pickers from 'react-color';

const PickerInput = ({ configuration, value, setValue }) => {
  const picker = pickers[configuration.type];
  return React.createElement(picker, {
    color: value,
    onChangeComplete: color => setValue(color.hex)
  });
};


reactInput('.colorpicker', 'reactR.colorpicker', PickerInput);
