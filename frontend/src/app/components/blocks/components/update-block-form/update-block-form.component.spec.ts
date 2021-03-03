import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UpdateBlockFormComponent } from './update-block-form.component';

describe('UpdateBlockFormComponent', () => {
  let component: UpdateBlockFormComponent;
  let fixture: ComponentFixture<UpdateBlockFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UpdateBlockFormComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UpdateBlockFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
