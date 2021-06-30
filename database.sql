-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 23 مايو 2020 الساعة 00:35
-- إصدار الخادم: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crud`
--

-- --------------------------------------------------------

--
-- بنية الجدول `daily_inspection`
--

CREATE TABLE `daily_inspection` (
  `type` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `specification` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `item_checked` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `done_check` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `signature` varchar(250) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `daily_inspection`
--

INSERT INTO `daily_inspection` (`type`, `specification`, `item_checked`, `done_check`, `signature`) VALUES
('General', 'Triage', 'Does the facility have a triage area with qualified nurses ?', 'Yes', 'Eng. Menna Rafat'),
('General', 'Triage', 'Is it located at the first point of contact with patients?', 'Yes', 'Eng. Menna Rafat'),
('General', 'Triage', 'Is there a standard operating procedure for triage?', 'Yes', 'Eng. Menna Rafat'),
('General', 'Triage', 'Is there a system for coding patients?', 'Yes', 'Eng. Menna Rafat'),
('General', 'Examination Room ', 'Does the examination room have a coach and a mackintosh?', 'No', 'Eng. Sondos Mohamed'),
('General', 'Examination Room ', 'Does the room have a consultation table with at least two chairs?', 'Yes', 'Eng. Sondos Mohamed'),
('General ', 'Examination Room ', 'Does the room have a pedal bin and stepper?', 'Yes', 'Eng. Sondos Mohamed'),
('General ', 'Examination Equipment', 'Is a thermometer available?', 'Yes', 'Eng. Sondos Mohamed'),
('General ', 'Examination Equipment', 'Is a blood pressure (BP) machine available/accessible?', 'Yes', 'Eng. Sondos Mohamed'),
('General ', 'Examination Equipment', 'Is a stethoscope available?', 'No', 'Eng. Ghada Adel'),
('General ', 'Examination Equipment', 'Is a tongue depressor available?', 'Yes', 'Eng. Ghada Adel'),
('General ', 'Examination Equipment', 'Is a weighing scale available/accessible?', 'Yes', 'Eng. Ghada Adel'),
('General ', 'Examination Equipment', 'Is a torch available?', 'Yes', 'Eng. Ghada Adel'),
('General ', 'Examination Equipment', 'Is a privacy screen available?', 'Yes', 'Eng. Ghada Adel'),
('General ', 'Examination Equipment', 'Is a diagnostic set available?', 'No', 'Eng. Ghada Adel'),
('General ', 'Emergency tray and equipment', 'Does the facility have an emergency tray available at designated sites?', 'Yes', 'Eng. Samar Ibrahim'),
('General ', 'Emergency tray and equipment', 'Is there a checklist for regular review and updates to the emergency tray?', 'Yes', 'Eng. Poline Atef'),
('Infection prevention and control', 'Hygiene protocol', 'Is there a hygiene protocol with a dedicated staff roster available?', 'Yes', 'Eng. Poline Atef'),
('Infection prevention and control', 'hand washing', 'Is a sink present with running water from a tap or modified storage container?', 'Yes', 'Eng. Poline Atef'),
('Infection prevention and control', 'hand washing', 'Is soap available at the hand washing area?', 'No', 'Eng.Sondos Mohamed'),
('Infection prevention and control', 'solid waste management', 'Are there standard operating procedures for waste management?', 'Yes', 'Eng.Sondos Mohamed'),
('Infection prevention and control', 'solid waste management', 'Are there at least two color-coded bins (Red, black and/or yellow)?', 'Yes', 'Eng.Sondos Mohamed'),
('Infection prevention and control', 'solid waste management', 'Are there coded lining bags that match the color of the bins?', 'Yes', 'Eng.Sondos Mohamed'),
('Infection prevention and control', 'use of disenfectants', 'Is there evidence of disinfectant use?', 'No', 'Eng.Sondos Mohamed'),
('Infection prevention and control', 'use of disenfectants', 'Are you able to observe disinfectant containers used for cleaning?', 'No', 'Eng.Sondos Mohamed'),
('Infection prevention and control', 'protective equipment', 'Are gowns or dust coats available?', 'Yes', 'Eng.Sondos Mohamed'),
('Infection prevention and control', 'protective equipment', 'Are gloves available?', 'No', 'Eng.Sondos Mohamed'),
('General', 'Triage', 'Does the facility have a triage area with qualified nurses ?', 'No', '');

-- --------------------------------------------------------

--
-- بنية الجدول `devices`
--

CREATE TABLE `devices` (
  `Department` varchar(250) NOT NULL,
  `Device name` varchar(250) NOT NULL,
  `Device brand` varchar(250) NOT NULL,
  `Model` varchar(250) NOT NULL,
  `Serial num.` varchar(250) NOT NULL,
  `country of origin` varchar(250) NOT NULL,
  `supply date` int(250) NOT NULL,
  `starting date` int(250) NOT NULL,
  `insurance period` int(250) NOT NULL,
  `supply company` varchar(250) NOT NULL,
  `Maintenance company` varchar(250) NOT NULL,
  `Type of contract` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- إرجاع أو استيراد بيانات الجدول `devices`
--

INSERT INTO `devices` (`Department`, `Device name`, `Device brand`, `Model`, `Serial num.`, `country of origin`, `supply date`, `starting date`, `insurance period`, `supply company`, `Maintenance company`, `Type of contract`) VALUES
('Dental', 'motor', 'GAMBERINI', 'OG/6', '12251205', 'Italy', 0, 0, 0, '', '', 'Spare parts not included'),
('Dental', 'motor', 'GAMBERINI', 'OG/6', '12251205', 'Italy', 0, 0, 0, '', '', 'Spare parts not included'),
('Dental', 'motor', 'FARO', 'ART.486500', '40770', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'ART.486500', '40770', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'Art.486501', '486501', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'Art.486501', '486501', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'ART.486502', '35733', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'ART.486502', '35733', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'Polishing motor', 'OMEC', 'BIP2', '362', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'Polishing motor', 'OMEC', 'BIP2', '362', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'GAMBERINI', 'OG/6', '12251205', 'Italy', 0, 0, 0, '', '', 'Spare parts not included'),
('Dental', 'motor', 'GAMBERINI', 'OG/6', '12251205', 'Italy', 0, 0, 0, '', '', 'Spare parts not included'),
('Dental', 'motor', 'FARO', 'ART.486500', '40770', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'ART.486500', '40770', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'Art.486501', '486501', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'Art.486501', '486501', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'ART.486502', '35733', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'motor', 'FARO', 'ART.486502', '35733', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'Polishing motor', 'OMEC', 'BIP2', '362', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('Dental', 'Polishing motor', 'OMEC', 'BIP2', '362', 'Italy', 0, 0, 0, '', '', 'spare parts not included'),
('ear and nose', 'ear pressure gauge ', 'flute', 'HFW/PBiNTEB', 'IM/DE/4/00354', 'France', 31, 0, 0, '', 'Elnahar', 'spare parts not included'),
('ear and nose', 'ear pressure gauge ', 'flute', 'HFW/PBiNTEB', 'IM/DE/4/00354', 'France', 31, 0, 0, '', 'Elnahar', 'spare parts not included'),
('ear and nose', 'Nosopharyngoscope', 'carl stories', '1100', '9290', 'USA', 0, 0, 0, '', '', 'spare parts not included'),
('ear and nose', 'Nosopharyngoscope', 'carl stories', '1100', '9290', 'USA', 0, 0, 0, '', '', 'spare parts not included'),
('ear and nose', 'Electronic audiometer', 'GSI', 'GSI61', 'aa073531', 'USA', 0, 0, 0, '', '', 'spare parts not included'),
('ear and nose', 'Electronic audiometer', 'GSI', 'GSI61', 'aa073531', 'USA', 0, 0, 0, '', '', 'spare parts not included'),
('ear and nose', 'Balance device', 'entracostcast', 'afx21', 'AF214176', 'Denmark', 0, 0, 0, '', 'segma', 'spare parts not included'),
('ear and nose', 'Balance device', 'entracostcast', 'afx21', 'AF214176', 'Denmark', 0, 0, 0, '', 'segma', 'spare parts not included'),
('ear and nose', 'Autoclave sterilization', 'comniks', 'Mod5.5', 'without 0003', 'USA', 0, 0, 0, '', 'elalamya lltegata', 'spare parts not included'),
('ear and nose', 'Flexible laryngoscope', 'wolf', 'without', 'without 0125', 'France', 0, 0, 0, '', '', 'spare parts not included'),
('ear and nose', 'Autoclave sterilization', 'comniks', 'Mod5.5', 'without 0003', 'USA', 0, 0, 0, '', 'elalamya lltegata', 'spare parts not included'),
('ear and nose', 'Flexible laryngoscope', 'wolf', 'without', 'without 0125', 'France', 0, 0, 0, '', '', 'spare parts not included'),
('ear and nose', 'Audiometric device', 'entrcostcast', 'VER ECLIPSE', 'SN0923976', 'France', 0, 0, 0, '', 'segma', 'spare parts not included'),
('ear and nose', 'Cochlear Excavator Motor', 'medtronics', 'without', 'Entc77967', 'France', 0, 0, 0, '', 'elahlya', 'spare parts not included'),
('ear and nose', 'Audiometric device', 'entrcostcast', 'VER ECLIPSE', 'SN0923976', 'France', 0, 0, 0, '', 'segma', 'spare parts not included'),
('ear and nose', 'Cochlear Excavator Motor', 'medtronics', 'without', 'Entc77967', 'France', 0, 0, 0, '', 'elahlya', 'spare parts not included'),
('heart clinic', 'ultrasound', 'SIEMENS', 'Acuson cv70', 'GM-56700A00E', 'unknown', 0, 0, 2, '', '', ''),
('heart clinic', 'ultrasound', 'SIEMENS', 'Acuson cv70', 'GM-56700A00E', 'unknown', 0, 0, 2, '', '', ''),
('heart clinic', 'heart ultrasound', 'GE', 'vivid E9', 'VE97982', 'USA', 0, 0, 2, 'alkan medical', '', ''),
('heart clinic', 'stress ECG', 'PHILIPS', 'TMX425', 'FV-12133', 'USA', 0, 0, 2, 'elmagmoaa elmasria', '', ''),
('heart clinic', 'heart ultrasound', 'GE', 'vivid E9', 'VE97982', 'USA', 0, 0, 2, 'alkan medical', '', ''),
('heart clinic', 'stress ECG', 'PHILIPS', 'TMX425', 'FV-12133', 'USA', 0, 0, 2, 'elmagmoaa elmasria', '', ''),
('heart clinic', 'ultrasound', 'SIEMENS', 'Acuson cv70', 'GM-56700A00E', '', 0, 0, 2, '', '', ''),
('heart clinic', 'ultrasound', 'SIEMENS', 'Acuson cv70', 'GM-56700A00E', '', 0, 0, 2, '', '', ''),
('heart clinic', 'ECG recorder', 'SCHILLER', 'MT-101', '300.16040', 'Swaziland', 0, 0, 2, 'Geliongy', '', ''),
('heart clinic', 'ECG recorder', 'SCHILLER', 'MT-101', '300.16040', 'Swaziland', 0, 0, 2, 'Geliongy', '', ''),
('heart clinic', 'ECG', 'SCHILLER', 'AT-102', '070.12247', 'Swaziland', 0, 0, 2, 'Geliongy', '', ''),
('dermatology clinic', 'Cryotherapy', 'CRYOPRO', 'maxi', 'L147957', 'Denmark', 0, 0, 2, '', '', ''),
('heart clinic', 'ECG', 'SCHILLER', 'AT-102', '070.12247', 'Swaziland', 0, 0, 2, 'Geliongy', '', ''),
('dermatology clinic', 'Cryotherapy', 'CRYOPRO', 'maxi', 'L147957', 'Denmark', 0, 0, 2, '', '', ''),
('dermatology clinic', 'Cryotherapy', 'CRYOPRO', 'maxi', 'L148578', 'Denmark', 0, 0, 2, '', '', ''),
('Obstetrics and Gynaecology clinic', 'Doppler', 'PHILIPS', 'Clear vue 650', 'US414A0128', 'Mexico', 0, 0, 2, 'elnile ', '', ''),
('dermatology clinic', 'Cryotherapy', 'CRYOPRO', 'maxi', 'L148578', 'Denmark', 0, 0, 2, '', '', ''),
('Obstetrics and Gynaecology clinic', 'Doppler', 'PHILIPS', 'Clear vue 650', 'US414A0128', 'Mexico', 0, 0, 2, 'elnile ', '', ''),
('dermatology clinic', 'UV device', 'WALDMANN', 'without', '05859-13', 'Poland', 0, 0, 2, '', '', ''),
('Dermatology clinic', 'Cryotherapy', 'CRYOPRO', 'maxi', 'L148569', 'Denmark', 0, 0, 2, '', '', ''),
('dermatology clinic', 'UV device', 'WALDMANN', 'without', '05859-13', 'Poland', 0, 0, 2, '', '', ''),
('Dermatology clinic', 'Cryotherapy', 'CRYOPRO', 'maxi', 'L148569', 'Denmark', 0, 0, 2, '', '', ''),
('Dermatology clinic', 'Cryotherapy', 'CONMED', 'HYFREGATOR 2000', '14DGJ412', 'USA', 0, 0, 0, 'Elmaktab el masry', '', ''),
('chest diseases clinic', 'thoracoscope', 'PENTAX', 'PENTAX3.2', 'EB1970TK', 'Japan', 0, 0, 2, 'Scope medical', '', ''),
('Dermatology clinic', 'Cryotherapy', 'CONMED', 'HYFREGATOR 2000', '14DGJ412', 'USA', 0, 0, 0, 'Elmaktab el masry', '', ''),
('chest diseases clinic', 'thoracoscope', 'PENTAX', 'PENTAX3.2', 'EB1970TK', 'Japan', 0, 0, 2, 'Scope medical', '', ''),
('Psychological and neurological clinic', 'EMG', 'EBN NEMUS', 'LANSTETUP', '19216817171', 'France', 0, 0, 2, '', '', ''),
('heart clinic', 'ECG', 'SCHILLER', 'AT-102', '070.12246', 'Swaziland', 0, 0, 2, 'Geliongy', '', ''),
('Psychological and neurological clinic', 'EMG', 'EBN NEMUS', 'LANSTETUP', '19216817171', 'France', 0, 0, 2, '', '', ''),
('heart clinic', 'ECG', 'SCHILLER', 'AT-102', '070.12246', 'Swaziland', 0, 0, 2, 'Geliongy', '', ''),
('heart clinic', 'ECG', 'SCHILLER', 'AT-102', '070.12263', 'Swaziland', 0, 0, 2, '', '', ''),
('Psychological and neurological clinic', 'EEG', 'NIHONKOHDEN', 'EEG-7310F', '00826', 'Japan', 0, 0, 2, 'Elkahera', '', ''),
('heart clinic', 'ECG', 'SCHILLER', 'AT-102', '070.12263', 'Swaziland', 0, 0, 2, '', '', ''),
('Psychological and neurological clinic', 'EEG', 'NIHONKOHDEN', 'EEG-7310F', '00826', 'Japan', 0, 0, 2, 'Elkahera', '', '');

-- --------------------------------------------------------

--
-- بنية الجدول `engineers`
--

CREATE TABLE `engineers` (
  `Name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `engineers`
--

INSERT INTO `engineers` (`Name`, `Email`, `ID`) VALUES
('Sondos Mohamed ', 'Sobassoxx@gmail.com', 3103),
('Samar Ibrahim ', 'ibrahimsamar858@gmail.com', 3101),
('Ghada Adel', 'ghadaelgharbawy97@gmail.com', 3102),
('Menna Rafat', 'menna12rere@gmail.com', 3104);

-- --------------------------------------------------------

--
-- بنية الجدول `ppm_laryngo`
--

CREATE TABLE `ppm_laryngo` (
  `item` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `serial_no` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `Date` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `maintenance` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `failure` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `Description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `Cause` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `Part_maintained` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `time_required` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `parts_replaced` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `signature` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `ppm_laryngo`
--

INSERT INTO `ppm_laryngo` (`item`, `serial_no`, `Date`, `maintenance`, `failure`, `Description`, `Cause`, `Part_maintained`, `time_required`, `parts_replaced`, `signature`, `comment`) VALUES
('Ear pressure gauge', 'IM/DE/4/00354', '7/5/2020', 'Done', 'found', 'Many pieces of equipment vibrate. However, excessive vibration can lead to gauge failure and may indicate a problem with a component. Solution: install a gauge that will resist vibration better — i.e., a liquid-filled or direct-drive gauge with only a single moving part.', 'Vibration.', 'reference electronic manometer', 'From 09:00 AM To 09:00 PM', 'None', 'Eng. Samar Ibrahim', 'None'),
('Nose and pharyngoscope', '9290', '10/5/2020', 'Done', 'found', 'there is light shining through the highly flexible, thin-walled probe tube.', 'this is due to the loss of sheathing taking place continuously in the case of light fibers. This appearance in varying intensity has no effect on the illumination intensity at the tip of the flexible endoscope.', 'patented LEDS ', 'From 09:00 AM To 02:00 PM', 'Hybrid aluminum handle - the proximal and distal glass surfaces', 'Eng. Ghada Adel', 'Caution: Endoscopes with damaged fiber optic should be sent for inspection to the manufacturer or a service center'),
('Electronic audiometer', 'aa073531', 'None', 'Not Done', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None'),
('Balance device', 'afx21 ', '10/5/2020', 'Done', 'found', 'nothing id displayed on the display panel', 'the power supply voltage is wrong', 'main body - pan - glass door - display panel', 'From 09:00 AM To 02:00 PM', 'None', 'Eng. Samar Ibrahim', 'this is the amount of the discrepancy between the value indicates by the balance and the correct value'),
('Autoclave sterilization', 'without 0003', '10/5/2020', 'Done', 'found', '1) The machine is leaking at the door - 2) Low Temp’ is displayed ', '1) The Door Gasket needs to be replaced - 2) the air trap inside the water reservoir needs to be checked', 'Reservoir water drain valve - Ring for drain valve - Autoclave cover - Door switch - Water reservoir – assembly - Safety valve - Air relief valve - Pressure gauge - Panel base', 'From 03:00 PM To 09:00 PM', 'Tray Handle                 - Tray Holder                       - Autoclave cover                   - Water reservoir cover - Flat cable for ANL-T1 – RS232 - Door closing device', 'Eng. Ghada Adel', 'The pull-type solenoid locks the door If power failed or has been turned off while the autoclave is in operation, even if power has been restored. So, you should press the START/STOP key to cancel the door locking at the end of the operation. '),
('Flexible laryngoscope', 'without 0125', '10/5/2020', 'Done', 'found', 'Isolated UES dysfunction (referred to as cricopharyngeal spasm or cricopharyngeal achalasia) refers to failure of the PE opening without evidence of pharyngeal paresis or evidence of esophageal disease.', 'dysphagia is caused by obstruction at the level of the PE, due to either fibrosis (scarring) of the PE or UES dysfunction. Failure of UES relaxation may be documented by manometry', 'Oxygen port - elecrical contact', 'From 03:00 PM To 09:00 PM', 'bulb - blade', 'Eng. Ghada Adel', 'The laryngoscope must be inspected directly before sterilization.'),
('Audiometric device', 'SN0923976', '11/5/2020', 'Done', 'found', 'there is a problem at Headphone selector box and audiometer patch cords ', 'Unknown', 'Rechargeable Handle    - disposable specula      - Micro Audiometrics Earscan acoustic impedance tympanometer with probe cuffs                 - Quest Model BA-201-25 bioacoustic simulator and octave band monitor with insert - earphone adapters     - Hex wrench - Hex key set - Petroleum jelly - Pipe cleaners', 'From 09:00 AM To 03:00 PM', 'preamp cable - microphone adapter ring ', 'Eng. Samar Ibrahim', 'Problem with test equipment or the ISIS system, or high ambient noise, which precluded pure tone testing'),
('Cochlear Excavator Motor', 'Entc77967', '11/5/2020', 'Done', 'Not found', 'None', 'None', 'Monitor earphones - Earhook - Connector Socket - Earpiece', 'From 04:00 PM To 09:00 PM', 'PVC and ABS plastic     - Sealed internal epoxy Fi breglass and polyimide printed circuit boards                     - The earpiece cable consists of polyurethane with TU polymer', 'Eng. Samar Ibrahim', 'To use the monitor earphones: 1. Make sure your processor is turned on. 2. Lift the socket cover and push the monitor earphone plug into the accessory socket at the base of the BTE Controller or Bodyworn Controller shoe. Do not try to force the plug into the socket.');

-- --------------------------------------------------------

--
-- بنية الجدول `risk_assess`
--

CREATE TABLE `risk_assess` (
  `Department` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `Equipment` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `serial_Num` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `Done_or_Not` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `signature` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `Date` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `A_Equipment_Function` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `B_Risk_associated_with_equipment_failure` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `C_Preventive_maintenance_requirement` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `D_Likelihood_failure` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `E_Main_area_of_equipment_use` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `Total_Score` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `Inventory_Classification_Result` varchar(250) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `risk_assess`
--

INSERT INTO `risk_assess` (`Department`, `Equipment`, `serial_Num`, `Done_or_Not`, `signature`, `Date`, `A_Equipment_Function`, `B_Risk_associated_with_equipment_failure`, `C_Preventive_maintenance_requirement`, `D_Likelihood_failure`, `E_Main_area_of_equipment_use`, `Total_Score`, `Inventory_Classification_Result`) VALUES
('Heart clinic', 'ECG', '070.12247', 'Done', 'Eng. Samar Ibrahim', '15/5/2020', 'Diagnostic-other physiological monitoring=6', 'Potential patient death=5', 'Monthly=5', 'Less than three months=5', 'Critical/Intensive care locations=4', '6+5+(5+5+4)/3 = 15.6667', 'Medium risk (score 15 to 17)'),
('Dermatology clinic', 'Cryotherapy', 'L147957', 'Done', 'Eng .Toka Hakim', '15/5/2020', 'Therapeuti-physical therapy or treatment=8', 'Inappropriate therapy or misdiagnosis=3', 'Semi-annually=3', 'Approximately 1 to 3 years=2', 'Labs/Exam areas=3', '8+3+(3+2+3)/3 = 13.6667', 'Low risk (score 12 to 14)'),
('Obstetrics and Gynaecology clinic', 'Doppler', 'US414A0128', 'Done', 'Eng, Menna Raafat', '16/5/2020', 'Diagnostic-other physiological monitoring=6', 'Inappropriate therapy or misdiagnosis=3', 'Quarterly=4', 'Approximately 4 to 6 months=4', 'General care areas=2', '6+3+(4+4+2)/3 = 12.333', 'Low risk (score 12 to 14)'),
('Dermatology clinic', 'UV device', '05859-13', 'Not Done', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None'),
('Chest diseases clinic', 'thoracoscope', 'EB1970TK', 'Done', 'Eng. Ghada Adel', '16/5/2020', 'Diagnostic-surgical ot intensive care moniroring=7', 'Potential patient death=5', 'Monthly=5', 'Approximately 4 to 6 months=4', 'Critical/Intensive care locations=4', '7+5+(5+4+4)/3 = 16.333', 'Medium risk (score 15 to 17)'),
('Psychological and neurological clinic', 'EMG', '19216817171', 'Done', 'Eng. Ghada Adel', '16/5/2020', 'Diagnostic-other physiological monitoring=6', 'Potential patient death=5', 'Monthly=5', 'Approximately 4 to 6 months=4', 'Critical/Intensive care locations=4', '6+5+(5+4+4)/3 = 15.3333', 'Medium risk (score 15 to 17)');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
