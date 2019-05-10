import { reactShinyInput } from 'reactR';
import * as pickers from 'react-color';

const PickerInput = ({ configuration, value, setValue }) => {
  const picker = pickers[configuration.type];
  return React.createElement(picker, {
    color: value,
    onChangeComplete: color => {
      setValue(color.rgb, true);
    }
  });
};

reactShinyInput(
  '.colorpicker',
  'reactR.colorpicker',
  PickerInput,
  {
    type: "reactR.colorpicker.color",
    ratePolicy: {
      policy: "throttle",
      delay: 250
    }
  }
);
