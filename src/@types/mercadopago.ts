export type IPublicKey = string;
export type IPrivateKey = string;

export interface ICardToken {
  card_id: string;
  card_number_length: number;
  cardholder: {
    identification: {
      number: string;
      type: string;
    };
    name: string;
  };
  creation_date: Date;
  due_date: Date;
  esc: string;
  expiration_month: number;
  expiration_year: number;
  first_six_digits: string;
  id: string;
  last_four_digits: string;
  last_modified_date: Date;
  luhn_validation: string;
  public_key: string;
  security_code_length: number;
  status: string;
  trunc_card_number: string;
  used_date: Date;
}
