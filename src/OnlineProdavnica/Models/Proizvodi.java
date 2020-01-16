package OnlineProdavnica.Models;

public class Proizvodi {
	public int Id;
	public String Naziv;
	public String Opis;
	public String DatumObjave;
	public String UrlSlike;
	public int AdministratorId;
	
	
	public int getAdministratorId() {
		return AdministratorId;
	}
	public void setAdministratorId(int administratorId) {
		AdministratorId = administratorId;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getNaziv() {
		return Naziv;
	}
	public void setNaziv(String naziv) {
		Naziv = naziv;
	}
	public String getOpis() {
		return Opis;
	}
	public void setOpis(String opis) {
		Opis = opis;
	}
	public String getDatumObjave() {
		return DatumObjave;
	}
	public void setDatumObjave(String datumObjave) {
		DatumObjave = datumObjave;
	}
	public String getUrlSlike() {
		return UrlSlike;
	}
	public void setUrlSlike(String urlSlike) {
		UrlSlike = urlSlike;
	}
	
}
