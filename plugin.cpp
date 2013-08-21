/* this is our plugin class header file */
#include "plugin.h"

AudioEffect* createEffectInstance(audioMasterCallback audioMaster)
{
    return new Plugin(audioMaster);
}


Plugin::Plugin (audioMasterCallback audioMaster)
  : AudioEffectX (audioMaster, 0, 1)
  { 
     setNumInputs  (2); // stereo in
     setNumOutputs (2); // stereo ou

     volume = 0.5f;
  }

Plugin::~Plugin() { }

void Plugin::processReplacing(float** inputs, float** outputs, VstInt32 vecframes)
{	
  float *in = inputs[0];
  float *out1 = outputs[0], *out2 = outputs[1];
  // processing loop    
  for(int i=0; i < vecframes; i++)
  {
   out1[i] = in[i] * volume; 
   out2[i] = in[i] * volume;
  }
} 


void  Plugin::setParameter (VstInt32 index, float value)
{ 
  switch (index)
  {
    case 0:
      volume = value; return;
    default:
      return;
  }
}
float Plugin::getParameter (VstInt32 index) 
{ 
  switch (index)
  {
    case 0:
      return volume; 
    default:
      return 0;
  }
}