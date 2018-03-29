import "bootstrap";

import { getCoordinates } from '../components/geoloc';
getCoordinates();

import "../plugins/flatpickr"
import { display } from '../components/geoloc';
display();

import { selectCity } from '../components/city_card';
selectCity();

