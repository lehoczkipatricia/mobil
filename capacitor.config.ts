import { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.fogadjorokbe.angular',
  appName: 'fogadj-orokbe',
  webDir: 'dist/fogadj-orokbe',
  server: {
    url: 'http://192.168.0.53:4200',
    cleartext: true
  },
  bundledWebRuntime: false
};


export default config;
