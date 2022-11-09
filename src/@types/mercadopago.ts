export type IPublicKey = string;

export interface IDevice {
  fingerprint: {
    os: string;
    system_version: string;
    ram: number;
    disk_space: number;
    model: string;
    free_disk_space: number;
    vendor_ids: {
      name: string;
      value: string;
    }[];
    vendor_specific_attributes: {
      feature_flash: boolean;
      can_make_phone_calls: boolean;
      can_send_sms: boolean;
      video_camera_available: boolean;
      cpu_count: number;
      simulator: boolean;
      device_languaje: string;
      device_idiom: string;
      platform: string;
      device_name: string;
      device_family: number;
      retina_display_capable: boolean;
      feature_camera: boolean;
      device_model: string;
      feature_front_camera: boolean;
    };
    resolution: string;
  };
}

export interface ICardToken {
  id: string;
  public_key: string;
  first_six_digits: string;
  expiration_month: number;
  expiration_year: number;
  last_four_digits: string;
  cardholder: {
    identification: {
      number: string;
      type: string;
    };
    name: string;
  };
  status: string;
  date_created: string;
  date_last_updated: string;
  date_due: string;
  luhn_validation: boolean;
  live_mode: boolean;
  require_esc: boolean;
  card_number_length: number;
  security_code_length: number;
}

export interface ICardTokenByCardId {
  id: string;
  public_key: string;
  card_id: string;
  status: string;
  date_created: string;
  date_last_updated: string;
  date_due: string;
  luhn_validation: boolean;
  live_mode: boolean;
  require_esc: boolean;
  security_code_length: number;
}
